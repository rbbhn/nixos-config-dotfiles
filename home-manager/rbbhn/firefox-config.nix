{ ... }: {
  programs.firefox = {
    enable = true;

    profiles.default = { # Hardened default profile
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "layout.css.prefers-color-scheme.content-override" = 0;
        "general.useragent.override" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.";
        "media.peerconnection.enabled" = false;
        "network.http.sendRefererHeader" = 0;
        "dom.storage.enabled" = false;
        "browser.sessionstore.privacy_level" = 2;
      };

      search = {
        force = true;
        default = "Google (&udm=14)";

        engines = {
          "Google (&udm=14)" = {
            urls = [{
              template = "https://www.google.com/search";
              params = [{
                name = "q";
                value = "{searchTerms}&udm=14";
              }];
            }];
          };
        };
      };

      userChrome = ''
        @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");
      '';
    };

    profiles.compatable = { # Semi-hardened "compatibility" profile
      id = 1;
      name = "compatible";
      isDefault = false;
      settings = {
        "layout.css.prefers-color-scheme.content-override" = 1;
        "network.http.referer.spoofSource" = true;
        "browser.sessionstore.privacy_level" = 1;
      };

      search = {
        force = true;
        default = "Google (&udm=14)";

        engines = {
          "Google (&udm=14)" = {
            urls = [{
              template = "https://www.google.com/search";
              params = [{
                name = "q";
                value = "{searchTerms}&udm=14";
              }];
            }];
          };
        };
      };

      userChrome = ''
        @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");
      '';
    };

    policies = {
      "NetworkPrediction" = false;
      "CaptivePortal" = false;
      "DNSOverHTTPS" = {
        "Enabled" = false;
      };
      "DisableFirefoxStudies" = true;
      "DisableTelemetry" = true;
      "DisablePocket" = true;

      ##############
      # Extensions #
      ##############
        /* extensions = with inputs.firefox-addons.packages.${pkgs.system}; [ # Stolen from nmasur's dotfiles - thanks!
        canvasblocker # Prevent privacy exploit with <canvs>
        decentraleyes # Prevents privacy exploit by locally injecting CDN resources
        don-t-fuck-with-paste # Prevents websites from fucking with paste
        keepassxc-browser # Password manager
        privacy-badger # Tracker blocker
        temporary-containers # Temporary containers
        umatrix # Advanced content blocking
      ]; */
      "ExtensionSettings" = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        "uBlock0@raymondhill.net" = { # uBlock Origin
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          "installation_mode" = "force_installed";
        };
        "@ublacklist" = { # ublacklist
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublacklist/latest.xpi";
          "installation_mode" = "force_installed";
        };
      };

      "Preferences" = {
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.update.auto" = false;
        "beacon.enabled" = false;
        "breakpad.reportURL" = "";
        "browser.aboutConfig.showWarning" = false;
        "browser.cache.offline.enable" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.disableResetPrompt" = true;
        "browser.download.useDownloadDir" = false;
        "browser.fixup.alternate.enabled" = false;
        "browser.newtab.preload" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.enhanced" = false;
        "browser.newtabpage.introShown" = true;
        "browser.safebrowsing.appRepURL" = "";
        "browser.safebrowsing.blockedURIs.enabled" = false;
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.safebrowsing.downloads.remote.url" = "";
        "browser.safebrowsing.enabled" = false;
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.selfsupport.url" = "";
        "browser.send_pings" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.trimURLs" = false;
        "browser.warnOnQuitShortcut" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "device.sensors.ambientLight.enabled" = false;
        "device.sensors.enabled" = false;
        "device.sensors.motion.enabled" = false;
        "device.sensors.orientation.enabled" = false;
        "device.sensors.proximity.enabled" = false;
        "dom.battery.enabled" = false;
        "dom.private-attribution.submission.enabled" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "dom.webaudio.enabled" = false;
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.manifest.uri" = "";
        "experiments.supported" = false;
        "extensions.blocklist.enabled" = false;
        "extensions.getAddons.cache.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.greasemonkey.stats.optedin" = false;
        "extensions.greasemonkey.stats.url" = "";
        "extensions.pocket.enabled" = false;
        "extensions.shield-recipe-client.api_url" = "";
        "extensions.shield-recipe-client.enabled" = false;
        "extensions.webservice.discoverURL" = "";
        "media.autoplay.default" = 1;
        "media.autoplay.enabled" = false;
        "media.eme.enabled" = false;
        "media.gmp-widevinecdm.enabled" = false;
        "media.navigator.enabled" = false;
        "media.video_stats.enabled" = false;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "network.IDN_show_punycode" = true;
        "network.allow-experiments" = false;
        "network.captive-portal-service.enabled" = false;
        "network.cookie.cookieBehavior" = 1;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enable-prefetch" = false;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;
        "network.trr.mode" = 5;
        "privacy.query_stripping" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.pbmode.enabled" = true;
        "privacy.usercontext.about_newtab_segregation.enabled" = true;
        "security.ssl.disable_session_identifiers" = true;
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
        "signon.autofillForms" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.cachedClientID" = "";
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "webgl.renderer-string-override" = " ";
        "webgl.vendor-string-override" = " ";

        "browser.urlbar.suggest.addons" = false; # Remove addons in search suggestions...
        "browser.urlbar.suggest.bookmark" = false; # Remove bookmarks in search suggestions...
        "browser.urlbar.suggest.clipboard" = false; # Remove clipboard events in search suggestions...
        "browser.urlbar.suggest.engines" = false; # Remove search engines in search suggestions...
        "browser.urlbar.suggest.fakespot" = false; # Remove fakespot(?) in search suggestions...
        "browser.urlbar.suggest.history" = false; # Remove search history in search suggestions...
        "browser.urlbar.suggest.mdn" = false; # Remove mozilla / firefox sites in search suggestions...
        "browser.urlbar.suggest.openpage" = false; # Remove open pages in search suggestions...
        "browser.urlbar.suggest.pocket" = false; # Remove pocket sites in search suggestions...
        "browser.urlbar.suggest.quickactions" = false; # Remove quick actions in search suggestions...
        "browser.urlbar.suggest.recentsearches" = false; # Remove recent searches in search suggestions...
        "browser.urlbar.suggest.remotetab" = false; # Remove remote tab(?) in search suggestions...
        "browser.urlbar.suggest.searches" = false; # Remove searches(?) in search suggestions...
        "browser.urlbar.suggest.topsites" = false; # Remove sponsored top sites in search suggestions...
        "browser.urlbar.suggest.trending" = false; # Remove trending top sites in search suggestions...
        "browser.urlbar.suggest.weather" = false; # Remove weater in search suggestions...
        "browser.urlbar.suggest.yelp" = false; # Remove yelp in search suggestions...

        "browser.warnOnQuit" = false; # Do not warn on quit
        "browser.startup.homepage" = "chrome://browser/content/blanktab.html"; # Set homepage
        "browser.urlbar.maxRichResults" = 0; # Remove "this time, search with..."

        "keyword.enabled" = true; # Sanity check; enables search

        "general.autoScroll" = true; # Enable autoscroll

        "privacy.clearOnShutdown_v2.cookiesAndStorage" = true; # Clear cookies & site data on close

        "signon.rememberSignons" = false; # Disable saving logins
        "signon.generation.enabled" = false; # Disable generating password
        "signon.firefoxRelay.feature" = "disabled"; # Disable relay masks
        "signon.management.page.breach-alerts.enabled" = false; # Disable password breach notifications

        "extensions.formautofill.addresses.enabled" = false; # Disable saving addresses
        "extensions.formautofill.creditCards.enabled" = false; # Disable saving payment info

        "privacy.history.custom" = true; # Define custom "settings for history"
        "places.history.enabled" = false; # Disable history
        "browser.formfill.enable" = false; # Disable storing search history
        "privacy.sanitize.sanitizeOnShutdown" = true; # Clear history, cookies on shutdown

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable userchrome / userstyle
      };
    };
  };
}
