const workSlackTeamMapping = {
  'auctionet': 'T7Q9KJ19B',
  'linearcustomers': 'TM567NELB',
};

const personalSlackMapping = {
  // personal slacks
};

const slackSubdomainMapping = {
  ...workSlackTeamMapping,
  ...personalSlackMapping,
};

const slackRewriter = {
  match: ["*.slack.com/*"],
  url: function(urlObj) {
    const subdomain = urlObj.host.slice(0, -10); // before .slack.com
    const pathParts = urlObj.pathname.split("/");

    let team,
      patterns = {};
    if (subdomain != "app") {
      if (!Object.keys(slackSubdomainMapping).includes(subdomain)) {
        console.log(
          `No Slack team ID found for ${urlObj.host}`,
          `Add a correct team ID to ~/.finicky.js to allow direct linking to Slack.`
        );
        return urlObj;
      }
      team = slackSubdomainMapping[subdomain];

      if (subdomain.slice(-11) == ".enterprise") {
        patterns = {
          file: [/\/files\/\w+\/(?<id>\w+)/],
        };
      } else {
        patterns = {
          file: [/\/messages\/\w+\/files\/(?<id>\w+)/],
          team: [/(?:\/messages\/\w+)?\/team\/(?<id>\w+)/],
          channel: [
            /\/(?:messages|archives)\/(?<id>\w+)(?:\/(?<message>p\d+))?/,
          ],
        };
      }
    } else {
      patterns = {
        file: [
          /\/client\/(?<team>\w+)\/\w+\/files\/(?<id>\w+)/,
          /\/docs\/(?<team>\w+)\/(?<id>\w+)/,
        ],
        team: [/\/client\/(?<team>\w+)\/\w+\/user_profile\/(?<id>\w+)/],
        channel: [
          /\/client\/(?<team>\w+)\/(?<id>\w+)(?:\/(?<message>[\d.]+))?/,
        ],
      };
    }

    for (let [host, host_patterns] of Object.entries(patterns)) {
      for (let pattern of host_patterns) {
        let match = pattern.exec(urlObj.pathname);
        if (match) {
          let search = `team=${team || match.groups.team}`;

          if (match.groups.id) {
            search += `&id=${match.groups.id}`;
          }

          if (match.groups.message) {
            let message = match.groups.message;
            if (message.charAt(0) == "p") {
              message = message.slice(1, 11) + "." + message.slice(11);
            }
            search += `&message=${message}`;
          }

          let outputStr = `slack://${host}?${search}`;
          console.log(
            `Rewrote Slack URL ${urlObj.href} to deep link ${outputStr}`
          );

          return new URL(outputStr);
        }
      }
    }

    return urlObj;
  },
};

const workPages = [
  "github.com",
  "*.auctionet.*",
  ""
]

export default {
  defaultBrowser: "Firefox",
  rewrite: [slackRewriter],
  handlers: [
    {
      match: "apple.com/*",
      browser: "Safari",
    },
    {
      match: "meet.google.com/*",
      browser: "Safari",
    },
    {
      match: "linear.app/*",
      browser: "Linear",
    },
    {
      match: ({ url }) => { return url.protocol === "slack" || url.protocol === "slack:" },
      browser: "Slack"
    },
  ],
}
