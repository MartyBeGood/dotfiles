function rewriteSlack(subdomainMapping) {
  return {
    match: ["*.slack.com/*"],
    url(urlObj) {
      const subdomain = urlObj.host.slice(0, -10); // before .slack.com

      let team, patterns = {};
      if (subdomain !== "app") {
        if (!(subdomain in subdomainMapping)) {
          console.log(
            `No Slack team ID found for ${urlObj.host}`,
            `Add a correct team ID to ~/.finicky.js to allow direct linking to Slack.`
          );
          return urlObj;
        }
        team = subdomainMapping[subdomain];

        if (subdomain.slice(-11) === ".enterprise") {
          patterns = {
            file: [/\/files\/\w+\/(?<id>\w+)/],
          };
        } else {
          patterns = {
            file: [/\/messages\/\w+\/files\/(?<id>\w+)/],
            team: [/(?:\/messages\/\w+)?\/team\/(?<id>\w+)/],
            channel: [/\/(?:messages|archives)\/(?<id>\w+)(?:\/(?<message>p\d+))?/],
          };
        }
      } else {
        patterns = {
          file: [
            /\/client\/(?<team>\w+)\/\w+\/files\/(?<id>\w+)/,
            /\/docs\/(?<team>\w+)\/(?<id>\w+)/,
          ],
          team: [/\/client\/(?<team>\w+)\/\w+\/user_profile\/(?<id>\w+)/],
          channel: [/\/client\/(?<team>\w+)\/(?<id>\w+)(?:\/(?<message>[\d.]+))?/],
        };
      }

      for (const [host, hostPatterns] of Object.entries(patterns)) {
        for (const pattern of hostPatterns) {
          const match = pattern.exec(urlObj.pathname);
          if (match) {
            let search = `team=${team || match.groups.team}`;
            if (match.groups.id) search += `&id=${match.groups.id}`;
            if (match.groups.message) {
              let message = match.groups.message;
              if (message[0] === "p") message = message.slice(1, 11) + "." + message.slice(11);
              search += `&message=${message}`;
            }
            const outputStr = `slack://${host}?${search}`;
            console.log(`Rewrote Slack URL ${urlObj.href} to deep link ${outputStr}`);
            return new URL(outputStr);
          }
        }
      }

      return urlObj;
    },
  };
}

const slackSubdomainMapping = {
  auctionet: "T7Q9KJ19B",
  linearcustomers: "TM567NELB",
  // personal slacks
};

const openInChromeHosts = [
  "linear.app/*",
  "auctionet.slack.com/*",
  "github.com/barsoom/*",
  "auctionet.devbox/*",
  "*.auctionet.com/*",
  "*.auctionet.dev/*",
  "*.tuple.app/*",
  "eu-app.honeybadger.io/*",
  "meet.google.com/*",
  "app.notion.com/*",
  (url) => url.host === "www.figma.com",
];

const openInChromeMatchers = [
  // space for more complex things to open in chrome
  ...openInChromeHosts.map(match => ({ match })),
];

const openInChrome = openInChromeMatchers.map(matcher =>({ ...matcher, browser: "Google Chrome" }))

export default {
  defaultBrowser: "Vivaldi",
  rewrite: [rewriteSlack(slackSubdomainMapping)],
  handlers: [
    ...openInChrome,
    { match: ({ url }) => url.protocol === "slack" || url.protocol === "slack:", browser: "Slack" },
  ],
};
