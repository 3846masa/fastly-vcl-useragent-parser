sub get_parsed_useragent STRING {
  declare local var.result STRING;
  set req.http.uap = "";

  if (req.http.user-agent ~ "(GeoEvent Server) (\d+)(?:\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ArcGIS Pro)(?: (\d+)\.(\d+)\.([^ ]+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "ArcGIS Client Using WinInet") {
    set req.http.uap:family = {"ArcMap"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OperationsDashboard)-(?:Windows)-(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Operations Dashboard for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(arcgisearth)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"ArcGIS Earth"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "com.esri.(earth).phone/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"ArcGIS Earth"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(arcgis-explorer)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Explorer for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "arcgis-(collector|aurora)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Collector for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(arcgis-workforce)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Workforce for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Collector|Explorer|Workforce)-(?:Android|iOS)-(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {""} re.group.1 {" for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Explorer|Collector)/(\d+) CFNetwork") {
    set req.http.uap:family = {""} re.group.1 {" for ArcGIS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "ArcGISRuntime-(Android|iOS|NET|Qt)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"ArcGIS Runtime SDK for "} re.group.1 {""};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "ArcGIS\.?(iOS|Android|NET|Qt)(?:-|\.)(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"ArcGIS Runtime SDK for "} re.group.1 {""};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "ArcGIS\.Runtime\.(Qt)\.(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"ArcGIS Runtime SDK for "} re.group.1 {""};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Luminary)[Stage]+/(\d+) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ESPN)[\x2520| ]+Radio/(\d+)\.(\d+)\.(\d+) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Antenna)/(\d+) CFNetwork") {
    set req.http.uap:family = {"AntennaPod"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(TopPodcasts)Pro/(\d+) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MusicDownloader)Lite/(\d+)\.(\d+)\.(\d+) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(.{0,200})-iPad\/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(.{0,200})-iPhone/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(.{0,200})/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|) CFNetwork") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Luminary)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(espn\.go)") {
    set req.http.uap:family = {"ESPN"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(espnradio\.com)") {
    set req.http.uap:family = {"ESPN"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "ESPN APP$") {
    set req.http.uap:family = {"ESPN"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(audioboom\.com)") {
    set req.http.uap:family = {"AudioBoom"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ " (Rivo) RHYTHM") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CFNetwork)(?:/(\d+)\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"CFNetwork"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Pingdom\.com_bot_version_)(\d+)\.(\d+)") {
    set req.http.uap:family = {"PingdomBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PingdomTMS)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"PingdomBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PingdomPageSpeed)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"PingdomBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ " (PTST)/(\d+)(?:\.(\d+)|)$") {
    set req.http.uap:family = {"WebPageTest.org bot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "X11; (Datanyze); Linux") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(NewRelicPinger)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"NewRelicPingerBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Tableau)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Tableau"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "AppleWebKit/\d{1,10}\.\d{1,10}.{0,200} Safari.{0,200} (CreativeCloud)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = {"Adobe CreativeCloud"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Salesforce)(?:.)\/(\d+)\.(\d?)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(\(StatusCake\))") {
    set req.http.uap:family = {"StatusCakeBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(facebookexternalhit)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"FacebookBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Google.{0,50}/\+/web/snippet") {
    set req.http.uap:family = {"GooglePlusBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "via ggpht\.com GoogleImageProxy") {
    set req.http.uap:family = {"GmailImageProxy"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "YahooMailProxy; https://help\.yahoo\.com/kb/yahoo-mail-proxy-SLN28749\.html") {
    set req.http.uap:family = {"YahooMailProxy"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Twitterbot)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Twitterbot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "/((?:Ant-|)Nutch|[A-z]+[Bb]ot|[A-z]+[Ss]pider|Axtaris|fetchurl|Isara|ShopSalad|Tailsweep)[ \-](\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(008|Altresium|Argus|BaiduMobaider|BoardReader|DNSGroup|DataparkSearch|EDI|Goodzer|Grub|INGRID|Infohelfer|LinkedInBot|LOOQ|Nutch|OgScrper|Pandora|PathDefender|Peew|PostPost|Steeler|Twitterbot|VSE|WebCrunch|WebZIP|Y!J-BR[A-Z]|YahooSeeker|envolk|sproose|wminer)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MSIE) (\d+)\.(\d+)([a-z]\d|[a-z]|);.{0,200} MSIECrawler") {
    set req.http.uap:family = {"MSIECrawler"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(DAVdroid)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Google-HTTP-Java-Client|Apache-HttpClient|PostmanRuntime|Go-http-client|scalaj-http|http\x2520client|Python-urllib|HttpMonitor|TLSProber|WinHTTP|JNLP|okhttp|aihttp|reqwest|axios|unirest-(?:java|python|ruby|nodejs|php|net))(?:[ /](\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Pinterest(?:bot|))/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)[;\s(]+\+https://www.pinterest.com/bot.html") {
    set req.http.uap:family = {"Pinterestbot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CSimpleSpider|Cityreview Robot|CrawlDaddy|CrawlFire|Finderbots|Index crawler|Job Roboter|KiwiStatus Spider|Lijit Crawler|QuerySeekerSpider|ScollSpider|Trends Crawler|USyd-NLP-Spider|SiteCat Webbot|BotName\/\$BotVersion|123metaspider-Bot|1470\.net crawler|50\.nu|8bo Crawler Bot|Aboundex|Accoona-[A-z]{1,30}-Agent|AdsBot-Google(?:-[a-z]{1,30}|)|altavista|AppEngine-Google|archive.{0,30}\.org_bot|archiver|Ask Jeeves|[Bb]ai[Dd]u[Ss]pider(?:-[A-Za-z]{1,30})(?:-[A-Za-z]{1,30}|)|bingbot|BingPreview|blitzbot|BlogBridge|Bloglovin|BoardReader Blog Indexer|BoardReader Favicon Fetcher|boitho.com-dc|BotSeer|BUbiNG|\b\w{0,30}favicon\w{0,30}\b|\bYeti(?:-[a-z]{1,30}|)|Catchpoint(?: bot|)|[Cc]harlotte|Checklinks|clumboot|Comodo HTTP\(S\) Crawler|Comodo-Webinspector-Crawler|ConveraCrawler|CRAWL-E|CrawlConvera|Daumoa(?:-feedfetcher|)|Feed Seeker Bot|Feedbin|findlinks|Flamingo_SearchEngine|FollowSite Bot|furlbot|Genieo|gigabot|GomezAgent|gonzo1|(?:[a-zA-Z]{1,30}-|)Googlebot(?:-[a-zA-Z]{1,30}|)|GoogleOther|Google SketchUp|grub-client|gsa-crawler|heritrix|HiddenMarket|holmes|HooWWWer|htdig|ia_archiver|ICC-Crawler|Icarus6j|ichiro(?:/mobile|)|IconSurf|IlTrovatore(?:-Setaccio|)|InfuzApp|Innovazion Crawler|InternetArchive|IP2[a-z]{1,30}Bot|jbot\b|KaloogaBot|Kraken|Kurzor|larbin|LEIA|LesnikBot|Linguee Bot|LinkAider|LinkedInBot|Lite Bot|Llaut|lycos|Mail\.RU_Bot|masscan|masidani_bot|Mediapartners-Google|Microsoft .{0,30} Bot|mogimogi|mozDex|MJ12bot|msnbot(?:-media {0,2}|)|msrbot|Mtps Feed Aggregation System|netresearch|Netvibes|NewsGator[^/]{0,30}|^NING|Nutch[^/]{0,30}|Nymesis|ObjectsSearch|OgScrper|Orbiter|OOZBOT|PagePeeker|PagesInventory|PaxleFramework|Peeplo Screenshot Bot|PHPCrawl|PlantyNet_WebRobot|Pompos|Qwantify|Read\x2520Later|Reaper|RedCarpet|Retreiver|Riddler|Rival IQ|scooter|Scrapy|Scrubby|searchsight|seekbot|semanticdiscovery|SemrushBot|Simpy|SimplePie|SEOstats|SimpleRSS|SiteCon|Slackbot-LinkExpanding|Slack-ImgProxy|Slurp|snappy|Speedy Spider|Squrl Java|Stringer|TheUsefulbot|ThumbShotsBot|Thumbshots\.ru|Tiny Tiny RSS|Twitterbot|WhatsApp|URL2PNG|Vagabondo|VoilaBot|^vortex|Votay bot|^voyager|WASALive.Bot|Web-sniffer|WebThumb|WeSEE:[A-z]{1,30}|WhatWeb|WIRE|WordPress|Wotbox|www\.almaden\.ibm\.com|Xenu(?:.s|) Link Sleuth|Xerka [A-z]{1,30}Bot|yacy(?:bot|)|YahooSeeker|Yahoo! Slurp|Yandex\w{1,30}|YodaoBot(?:-[A-z]{1,30}|)|YottaaMonitor|Yowedo|^Zao|^Zao-Crawler|ZeBot_www\.ze\.bz|ZooShot|ZyBorg|ArcGIS Hub Indexer|GPTBot|Google-InspectionTool)(?:[ /]v?(\d+)(?:\.(\d+)(?:\.(\d+)|)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(Boto3?|JetS3t|aws-(?:cli|sdk-(?:cpp|go|go-v\d|java|nodejs|ruby2?|dotnet-(?:\d{1,2}|core)))|s3fs)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(FME)\/(\d+\.\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QGIS)\/(\d)\.?0?(\d{1,2})\.?0?(\d{1,2})") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(JOSM)/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Tygron Platform) \((\d+)\.(\d+)\.(\d+(?:\.\d+| RC \d+\.\d+))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\[(FBAN/MessengerForiOS|FB_IAB/MESSENGER);FBAV/(\d+)(?:\.(\d+)(?:\.(\d+)(?:\.(\d+)|)|)|)") {
    set req.http.uap:family = {"Facebook Messenger"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\[FB.{0,300};(FBAV)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Facebook"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\[FB.{0,300};") {
    set req.http.uap:family = {"Facebook"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(RecipeRadar)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^.{0,200}?(?:\/[A-Za-z0-9\.]{0,50}|) {0,2}([A-Za-z0-9 \-_\!\[\]:]{0,50}(?:[Aa]rchiver|[Ii]ndexer|[Ss]craper|[Bb]ot|[Ss]pider|[Cc]rawl[a-z]{0,50}))[/ ](\d+)(?:\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^.{0,200}?((?:[A-Za-z][A-Za-z0-9 -]{0,50}|)[^C][^Uu][Bb]ot)\b(?:(?:[ /]| v)(\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^.{0,200}?((?:[A-z0-9]{1,50}|[A-z\-]{1,50} ?|)(?: the |)(?:[Ss][Pp][Ii][Dd][Ee][Rr]|[Ss]crape|[Cc][Rr][Aa][Ww][Ll])[A-z0-9]{0,50})(?:(?:[ /]| v)(\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HbbTV)/(\d+)\.(\d+)\.(\d+) \(") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chimera|SeaMonkey|Camino|Waterfox)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SailfishBrowser)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Sailfish Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\[(Pinterest)/[^\]]{1,50}\]") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Pinterest)(?: for Android(?: Tablet|)|)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Instagram).(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Flipboard).(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Flipboard-Briefing).(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Onefootball)\/Android.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Snapchat)\/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Twitter for (?:iPhone|iPad)|TwitterAndroid)(?:\/(\d+)\.(\d+)|)") {
    set req.http.uap:family = {"Twitter"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(musical_ly) app_version\/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"TikTok"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(musical_ly_)(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"TikTok"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(BytedanceWebview)\/[a-z0-9]+") {
    set req.http.uap:family = {"TikTok"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(KAKAOTALK)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"KakaoTalk"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Phantom\/ios|Phantom\/android).(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Phantom"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,100}Mobile.{1,100}(AspiegelBot|PetalBot)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "AspiegelBot|PetalBot") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+) Basilisk/(\d+)") {
    set req.http.uap:family = {"Basilisk"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PaleMoon)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Pale Moon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*)") {
    set req.http.uap:family = {"Firefox Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)(pre)") {
    set req.http.uap:family = {"Firefox Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Firefox Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(?:Mobile|Tablet);.{0,200}(Firefox)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Firefox Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)\.(\d+(?:pre|))") {
    set req.http.uap:family = {"Firefox ("} re.group.1 {")"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(a\d+[a-z]*)") {
    set req.http.uap:family = {"Firefox Alpha"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(b\d+[a-z]*)") {
    set req.http.uap:family = {"Firefox Beta"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)-(?:\d+\.\d+|)/(\d+)\.(\d+)(a\d+[a-z]*)") {
    set req.http.uap:family = {"Firefox Alpha"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)-(?:\d+\.\d+|)/(\d+)\.(\d+)(b\d+[a-z]*)") {
    set req.http.uap:family = {"Firefox Beta"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)([ab]\d+[a-z]*|)") {
    set req.http.uap:family = {"Firefox ("} re.group.1 {")"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox).{0,200}Tablet browser (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"MicroB"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MozillaDeveloperPreview)/(\d+)\.(\d+)([ab]\d+[a-z]*|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(FxiOS)/(\d+)\.(\d+)(\.(\d+)|)(\.(\d+)|)") {
    set req.http.uap:family = {"Firefox iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Flock)/(\d+)\.(\d+)(b\d+?)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(RockMelt)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Navigator)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Netscape"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Navigator)/(\d+)\.(\d+)([ab]\d+)") {
    set req.http.uap:family = {"Netscape"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Netscape6)/(\d+)\.(\d+)\.?([ab]?\d+|)") {
    set req.http.uap:family = {"Netscape"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MyIBrow)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"My Internet Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(UC? ?Browser|UCWEB|U3)[ /]?(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"UC Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Opera Tablet).{0,200}Version/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Opera Mini)(?:/att|)/?(\d+|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Opera)/.{1,100}Opera Mobi.{1,100}Version/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Opera Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Opera)/(\d+)\.(\d+).{1,100}Opera Mobi") {
    set req.http.uap:family = {"Opera Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Opera Mobi.{1,100}(Opera)(?:/|\s+)(\d+)\.(\d+)") {
    set req.http.uap:family = {"Opera Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Opera Mobi") {
    set req.http.uap:family = {"Opera Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Opera)/9.80.{0,200}Version/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(?:Mobile Safari).{1,300}(OPR)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Opera Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(?:Chrome).{1,300}(OPR)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Opera"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Coast)/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"Opera Coast"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OPiOS)/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"Opera Mini"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Chrome/.{1,200}( MMS)/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"Opera Neon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(hpw|web)OS/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"webOS Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(luakit)") {
    set req.http.uap:family = {"LuaKit"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Snowshoe)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Gecko/\d+ (Lightning)/(\d+)\.(\d+)\.?((?:[ab]?\d+[a-z]*)|(?:\d*))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)\.(\d+(?:pre|)) \(Swiftfox\)") {
    set req.http.uap:family = {"Swiftfox"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)([ab]\d+[a-z]*|) \(Swiftfox\)") {
    set req.http.uap:family = {"Swiftfox"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(rekonq)/(\d+)\.(\d+)(?:\.(\d+)|) Safari") {
    set req.http.uap:family = {"Rekonq"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "rekonq") {
    set req.http.uap:family = {"Rekonq"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(conkeror|Conkeror)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Conkeror"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(konqueror)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Konqueror"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(WeTab)-Browser") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Comodo_Dragon)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Comodo Dragon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Symphony) (\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "PLAYSTATION 3.{1,200}WebKit") {
    set req.http.uap:family = {"NetFront NX"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "PLAYSTATION 3") {
    set req.http.uap:family = {"NetFront"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PlayStation Portable)") {
    set req.http.uap:family = {"NetFront"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PlayStation Vita)") {
    set req.http.uap:family = {"NetFront NX"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "AppleWebKit.{1,200} (NX)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"NetFront NX"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Nintendo 3DS)") {
    set req.http.uap:family = {"NetFront NX"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HuaweiBrowser)/(\d+)\.(\d+)\.(\d+)\.\d+") {
    set req.http.uap:family = {"Huawei Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AVG)/(\d+)\.(\d+)\.(\d+)\.\d+") {
    set req.http.uap:family = {"AVG"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AvastSecureBrowser|Avast)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Avast Secure Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Instabridge)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AlohaBrowser|ABB)/(\d+)\.(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Aloha Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "((?:B|b)rave(?:\sChrome)?)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Brave"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(?:\()?Brave(?:\))?\s*$") {
    set req.http.uap:family = {"Brave"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Silk)/(\d+)\.(\d+)(?:\.([0-9\-]+)|)") {
    set req.http.uap:family = {"Amazon Silk"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Puffin)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Windows Phone .{0,200}(Edge)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Edge Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(EdgiOS|EdgA)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Edge Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OculusBrowser)/(\d+)\.(\d+)(?:\.([0-9\-]+)|)") {
    set req.http.uap:family = {"Oculus Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SamsungBrowser)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Samsung Internet"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SznProhlizec)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Seznam prohlížeč"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(coc_coc_browser)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Coc Coc"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MxBrowser)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Maxthon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Crosswalk)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Line)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"LINE"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MiuiBrowser)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"MiuiBrowser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Mint Browser)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Mint Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(TopBuzz)/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"TopBuzz"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Android.{1,200}(GSA)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Google"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(baidubrowser)[/\s](\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Baidu Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(FlyFlow|flyflow|baiduboxapp)/(\d+)\.(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Baidu Explorer"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MQQBrowser/Mini)(?:(\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"QQ Browser Mini"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MQQBrowser)(?:/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"QQ Browser Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QQBrowser)(?:/(\d+)(?:\.(\d+)\.(\d+)(?:\.(\d+)|)|)|)") {
    set req.http.uap:family = {"QQ Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(DuckDuckGo)/(\d+)") {
    set req.http.uap:family = {"DuckDuckGo Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}(DuckDuckGo)/(\d+)") {
    set req.http.uap:family = {"DuckDuckGo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}Mobile.{1,100}(Ddg)/(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"DuckDuckGo Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Mozilla.{1,200}(Ddg)/(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"DuckDuckGo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Tenta/)(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Tenta Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Ecosia) ios@(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Ecosia iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Ecosia) android@(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Ecosia Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(VivoBrowser)\/(\d+)\.(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(H[Ii]Browser)\/v(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"HiBrowser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HonorBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Honor Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(bdhonorbrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Honor Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HeyTapBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"HeyTap Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(weibo)__(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Weibo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(WeiboliteiOS|WeiboIntliOS)") {
    set req.http.uap:family = {"Weibo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PHX)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Phoenix Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Version/.{1,300}(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Chrome Mobile WebView"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "; wv\).{1,300}(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Chrome Mobile WebView"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CrMo)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Chrome Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CriOS)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Chrome Mobile iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+) Mobile(?:[ /]|$)") {
    set req.http.uap:family = {"Chrome Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ " Mobile .{1,300}(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Chrome Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(chromeframe)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Chrome Frame"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SLP Browser)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Tizen Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SE 2\.X) MetaSr (\d+)\.(\d+)") {
    set req.http.uap:family = {"Sogou Explorer"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Rackspace Monitoring)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"RackspaceBot"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PRTG Network Monitor)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PyAMF)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(YaBrowser)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Yandex Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(YaSearchBrowser)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Yandex Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+).{0,100} MRCHROME") {
    set req.http.uap:family = {"Mail.ru Chromium Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AOL) (\d+)\.(\d+); AOLBuild (\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PodCruncher|Downcast)[ /]?(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ " (BoxNotes)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Whale)/(\d+)\.(\d+)\.(\d+)\.(\d+) Mobile(?:[ /]|$)") {
    set req.http.uap:family = {"Whale"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Whale)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Whale"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(1Password)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Ghost)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "PAN (GlobalProtect)/(\d+)\.(\d+)\.(\d+) .{1,100} \(X11; Linux x86_64\)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(surveyon)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Surveyon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(115Browser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"115 Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Avira)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Avira"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CCleaner)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"CCleaner"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Norton)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Norton"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Quark)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Quark"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QuarkPC)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Quark PC"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SLBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+) SLBChan/(\d+)") {
    set req.http.uap:family = {"Smart Lenovo Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Atom)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Atom Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chrome)/\d+\.\d+\.\d+\.\d+ .* QIHU 360(?:SEi18n|ENT)") {
    set req.http.uap:family = {"360 Secure Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Decentr)") {
    set req.http.uap:family = {"Decentr Web3 Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Sparrow)") {
    set req.http.uap:family = {"Sparrow Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chromium GOST)") {
    set req.http.uap:family = {"Chromium GOST Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AOLShield)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"AOL Shield Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Hola)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Hola Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CravingExplorer)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Craving Explorer Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Talon)") {
    set req.http.uap:family = {"Talon Cyber Security Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Qaxbrowser)") {
    set req.http.uap:family = {"QAX Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ADG)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"AOL Desktop Gold Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SberBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Sber Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(JiSu)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"JiSu Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Wolvic)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Wolvic Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Thano)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"SmartTV WebBrowser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MicroMessenger)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"WeChat Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Odin)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Odin"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Colt)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"NetCast Smart TV"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Lite Browser)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Lite Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OMI)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Vewd Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Mypal)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Mypal Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Slack_SSB)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Slack Desktop Client"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HipChat)/?(\d+|)") {
    set req.http.uap:family = {"HipChat Desktop Client"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(MobileIron|FireWeb|Jasmine|ANTGalio|Midori|Fresco|Lobo|PaleMoon|Maxthon|Lynx|OmniWeb|Dillo|Camino|Demeter|Fluid|Fennec|Epiphany|Shiira|Sunrise|Spotify|Flock|Netscape|Lunascape|WebPilot|NetFront|Netfront|Konqueror|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|Opera Mini|iCab|NetNewsWire|ThunderBrowse|Iris|UP\.Browser|Bunjalloo|Google Earth|Raven for Mac|Openwave|MacOutlook|Electron|OktaMobile)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Microsoft Office Outlook 12\.\d+\.\d+|MSOffice 12") {
    set req.http.uap:family = {"Outlook"};
    set req.http.uap:major = {"2007"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Microsoft Outlook 14\.\d+\.\d+|MSOffice 14") {
    set req.http.uap:family = {"Outlook"};
    set req.http.uap:major = {"2010"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Microsoft Outlook 15\.\d+\.\d+") {
    set req.http.uap:family = {"Outlook"};
    set req.http.uap:major = {"2013"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Microsoft Outlook (?:Mail )?16\.\d+\.\d+|MSOffice 16") {
    set req.http.uap:family = {"Outlook"};
    set req.http.uap:major = {"2016"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Microsoft Office (Word) 2014") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Outlook-Express\/7\.0") {
    set req.http.uap:family = {"Windows Live Mail"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Airmail) (\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Thunderbird)/(\d+)\.(\d+)(?:\.(\d+(?:pre|))|)") {
    set req.http.uap:family = {"Thunderbird"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Postbox)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Postbox"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Barca(?:Pro)?)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Barca"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Lotus-Notes)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Lotus Notes"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "Superhuman") {
    set req.http.uap:family = {"Superhuman"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Vivaldi)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Edge?)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Edge"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)[\d.]{0,100} Iron[^/]") {
    set req.http.uap:family = {"Iron"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(Dolphin)(?: |HDCN/|/INT\-)(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(HeadlessChrome)(?:/(\d+)\.(\d+)\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Evolution)/(\d+)\.(\d+)\.(\d+\.\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(RCM CardDAV plugin)/(\d+)\.(\d+)\.(\d+(?:-dev|))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(bingbot|Bolt|AdobeAIR|Jasmine|IceCat|Skyfire|Midori|Maxthon|Lynx|Arora|IBrowse|Dillo|Camino|Shiira|Fennec|Phoenix|Flock|Netscape|Lunascape|Epiphany|WebPilot|Opera Mini|Opera|NetFront|Netfront|Konqueror|Googlebot|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|iCab|iTunes|MacAppStore|NetNewsWire|Space Bison|Stainless|Orca|Dolfin|BOLT|Minimo|Tizen Browser|Polaris|Abrowser|Planetweb|ICE Browser|mDolphin|qutebrowser|Otter|QupZilla|MailBar|kmail2|YahooMobileMail|ExchangeWebServices|ExchangeServicesClient|Dragon|Outlook-iOS-Android)/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Chromium|Chrome)/(\d+)\.(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(IEMobile)[ /](\d+)\.(\d+)") {
    set req.http.uap:family = {"IE Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(BacaBerita App)\/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(bPod|Pocket Casts|Player FM)$") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(AlexaMediaPlayer|VLC)/(\d+)\.(\d+)\.([^.\s]+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(AntennaPod|WMPlayer|Zune|Podkicker|Radio|ExoPlayerDemo|Overcast|PocketTunes|NSPlayer|okhttp|DoggCatcher|QuickNews|QuickTime|Peapod|Podcasts|GoldenPod|VLC|Spotify|Miro|MediaGo|Juice|iPodder|gPodder|Banshee)/(\d+)\.(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Peapod|Liferea)/([^.\s]+)\.([^.\s]+|)\.?([^.\s]+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(bPod|Player FM) BMID/(\S+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Podcast ?Addict)/v(\d+) ") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Podcast ?Addict) ") {
    set req.http.uap:family = {"PodcastAddict"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Replay) AV") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(VOX) Music Player") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(CITA) RSS Aggregator/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Pocket Casts)$") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Player FM)$") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(LG Player|Doppler|FancyMusic|MediaMonkey|Clementine) (\d+)\.(\d+)\.?([^.\s]+|)\.?([^.\s]+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(philpodder)/(\d+)\.(\d+)\.?([^.\s]+|)\.?([^.\s]+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Player FM|Pocket Casts|DoggCatcher|Spotify|MediaMonkey|MediaGo|BashPodder)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QuickTime)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Kinoma)(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Fancy) Cloud Music (\d+)\.(\d+)") {
    set req.http.uap:family = {"FancyMusic"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "EspnDownloadManager") {
    set req.http.uap:family = {"ESPN"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ESPN) Radio (\d+)\.(\d+)(?:\.(\d+)|) ?(?:rv:(\d+)|) ") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(podracer|jPodder) v ?(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ZDM)/(\d+)\.(\d+)[; ]?") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Zune|BeyondPod) (\d+)(?:\.(\d+)|)[\);]") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(WMPlayer)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Lavf)") {
    set req.http.uap:family = {"WMPlayer"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(RSSRadio)[ /]?(\d+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(RSS_Radio) (\d+)\.(\d+)") {
    set req.http.uap:family = {"RSSRadio"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Podkicker) \S+/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Podkicker"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(HTC) Streaming Player \S+ / \S+ / \S+ / (\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Stitcher)/iOS") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Stitcher)/Android") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(VLC) .{0,200}version (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ " (VLC) for") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(vlc)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"VLC"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(foobar)\S{1,10}/(\d+)\.(\d+|)\.?([\da-z]+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Clementine)\S{1,10} (\d+)\.(\d+|)\.?(\d+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(amarok)/(\d+)\.(\d+|)\.?(\d+|)") {
    set req.http.uap:family = {"Amarok"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Custom)-Feed Reader") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iRider|Crazy Browser|SkipStone|iCab|Lunascape|Sleipnir|Maemo Browser) (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iCab|Lunascape|Opera|Android|Jasmine|Polaris|Microsoft SkyDriveSync|The Bat!) (\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Kindle)/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Android) Donut") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Android) Eclair") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Android) Froyo") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Android) Gingerbread") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Android) Honeycomb") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"3"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MSIE) (\d+)\.(\d+).{0,100}XBLWP7") {
    set req.http.uap:family = {"IE Large Screen"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Nextcloud)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(mirall)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ownCloud-android)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Owncloud"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OC)/(\d+)\.(\d+)\.(\d+)\.(\d+) \(Skype for Business\)") {
    set req.http.uap:family = {"Skype"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OpenVAS)(?:-VT)?(?:[ \/](\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"OpenVAS Scanner"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AnyConnect)\/(\d+)(?:\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "compatible; monitis") {
    set req.http.uap:family = {"Monitis"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Obigo)InternetBrowser") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Obigo)\-Browser") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Obigo|OBIGO)[^\d]*(\d+)(?:.(\d+)|)") {
    set req.http.uap:family = {"Obigo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MAXTHON|Maxthon) (\d+)\.(\d+)") {
    set req.http.uap:family = {"Maxthon"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Maxthon|MyIE2|Uzbl|Shiira)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"0"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(BrowseX) \((\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(NCSA_Mosaic)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"NCSA Mosaic"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(POLARIS)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Polaris"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Embider)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Polaris"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(BonEcho)/(\d+)\.(\d+)\.?([ab]?\d+|)") {
    set req.http.uap:family = {"Bon Echo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(TopBuzz) com.alex.NewsMaster/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"TopBuzz"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(TopBuzz) com.mobilesrepublic.newsrepublic/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"TopBuzz"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(TopBuzz) com.topbuzz.videoen/(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"TopBuzz"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPhone|iPad).{1,200}GSA/(\d+)\.(\d+)\.(\d+)(?:\.(\d+)|) Mobile") {
    set req.http.uap:family = {"Google"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPhone|iPad).{1,200}Version/(\d+)\.(\d+)(?:\.(\d+)|).{1,200}[ +]Safari") {
    set req.http.uap:family = {"Mobile Safari"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad);.{0,30}CPU.{0,30}OS[ +](\d+)_(\d+)(?:_(\d+)|).{0,30} AppleNews\/\d+\.\d+(?:\.\d+|)") {
    set req.http.uap:family = {"Mobile Safari UI/WKWebView"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPhone|iPad).{1,200}Version/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Mobile Safari UI/WKWebView"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad).{0,200} Safari") {
    set req.http.uap:family = {"Mobile Safari"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad)") {
    set req.http.uap:family = {"Mobile Safari UI/WKWebView"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Watch)(\d+),(\d+)") {
    set req.http.uap:family = {"Apple "} re.group.1 {" App"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Outlook-iOS)/\d+\.\d+\.prod\.iphone \((\d+)\.(\d+)\.(\d+)\)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AvantGo) (\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OneBrowser)/(\d+).(\d+)") {
    set req.http.uap:family = {"ONE Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Avant)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QtCarBrowser)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(iBrowser/Mini)(\d+).(\d+)") {
    set req.http.uap:family = {"iBrowser Mini"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(iBrowser|iRAPP)/(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Nokia)") {
    set req.http.uap:family = {"Nokia Services (WAP) Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)\.(\d+)") {
    set req.http.uap:family = {"Nokia Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = {"Nokia Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Nokia Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(BrowserNG)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = {"Nokia Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Series60)/5\.0") {
    set req.http.uap:family = {"Nokia Browser"};
    set req.http.uap:major = {"7"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Series60)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Nokia OSS Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(S40OviBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Ovi Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Nokia)[EN]?(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PlayBook).{1,200}RIM Tablet OS (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"BlackBerry WebKit"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Black[bB]erry|BB10).{1,200}Version/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"BlackBerry WebKit"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Black[bB]erry)\s?(\d+)") {
    set req.http.uap:family = {"BlackBerry"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OmniWeb)/v(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Blazer)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Palm Blazer"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Pre)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Palm Pre"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ELinks)/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(ELinks) \((\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Links) \((\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(QtWeb) Internet Browser/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(PhantomJS)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AppleWebKit)/(\d+)(?:\.(\d+)|)\+ .{0,200} Safari") {
    set req.http.uap:family = {"WebKit Nightly"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Version)/(\d+)\.(\d+)(?:\.(\d+)|).{0,100}Safari/") {
    set req.http.uap:family = {"Safari"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Safari)/\d+") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OLPC)/Update(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(OLPC)/Update()\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"0"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(SEMC\-Browser)/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Teleca)") {
    set req.http.uap:family = {"Teleca Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Phantom)/V(\d+)\.(\d+)") {
    set req.http.uap:family = {"Phantom Browser"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Trident)/(7|8)\.(0)") {
    set req.http.uap:family = {"IE"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Trident)/(6)\.(0)") {
    set req.http.uap:family = {"IE"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Trident)/(5)\.(0)") {
    set req.http.uap:family = {"IE"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Trident)/(4)\.(0)") {
    set req.http.uap:family = {"IE"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Espial)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(AppleWebKit)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Apple Mail"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(?:\.(\d+)|$)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(pre|[ab]\d+[a-z]*|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "([MS]?IE) (\d+)\.(\d+)") {
    set req.http.uap:family = {"IE"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(python-requests)/(\d+)\.(\d+)") {
    set req.http.uap:family = {"Python Requests"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(Windows-Update-Agent|WindowsPowerShell|Microsoft-CryptoAPI|SophosUpdateManager|SophosAgent|Debian APT-HTTP|Ubuntu APT-HTTP|libcurl-agent|libwww-perl|urlgrabber|curl|PycURL|Wget|wget2|aria2|Axel|OpenBSD ftp|lftp|jupdate|insomnia|fetch libfetch|akka-http|got|CloudCockpitBackend|ReactorNetty|axios|Jersey|Vert.x-WebClient|Apache-CXF|Go-CF-client|go-resty|AHC|HTTPie)(?:[ /](\d+)(?:\.(\d+)|)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(cf)\/(\d+)\.(\d+)\.(\S+)") {
    set req.http.uap:family = {"CloudFoundry"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(sap-leonardo-iot-sdk-nodejs) \/ (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(SAP NetWeaver Application Server) \(1.0;(\d{1})(\d{2})\)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(\w+-HTTPClient)\/(\d+)\.(\d+)-(\S+)") {
    set req.http.uap:family = {"HTTPClient"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(go-cli)\s(\d+)\.(\d+).(\S+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Java-EurekaClient|Java-EurekaClient-Replication|HTTPClient|lua-resty-http)\/v?(\d+)\.(\d+)\.?(\d*)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(ping-service|sap xsuaa|Node-oauth|Site24x7|SAP CPI|JAEGER_SECURITY)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Python/3\.\d{1,3} aiohttp)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Python aiohttp"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Java)[/ ]?\d{1}\.(\d+)\.(\d+)[_-]*([a-zA-Z0-9]+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Java)[/ ]?(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(minio-go)/v(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(ureq)[/ ](\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(http\.rb)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(GuzzleHttp)/(\d+)\.(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(grab)\b") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Cyberduck)/(\d+)\.(\d+)\.(\d+)(?:\.\d+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(S3 Browser) (\d+)[.-](\d+)[.-](\d+)(?:\s*https?://s3browser\.com|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(S3Gof3r)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(ibm-cos-sdk-(?:core|java|js|python))/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(rusoto)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(rclone)/v(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Roku)/DVP-(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Kurio)\/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Kurio App"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(Box(?: Sync)?)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "^(ViaFree|Viafree)-(?:tvOS-)?[A-Z]{2}/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"ViaFree"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Transmit)/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Download Master)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "\b(HTTrack) (\d+)\.(\d+)(?:[\.\-](\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(Ladybird)\/(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else if (req.http.user-agent ~ "(MullvadBrowser)/(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
  } else {
  }

  set var.result = req.http.uap;
  unset req.http.uap;

  return var.result;
}


sub get_useragent_os STRING {
  declare local var.result STRING;
  set req.http.uap = "";

  if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+ \( ;(LG)E ;NetCast 4.0") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2013"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+ \( ;(LG)E ;NetCast 3.0") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2012"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/1.1.1 \(;;;;;\) Maple_2011") {
    set req.http.uap:family = {"Samsung"};
    set req.http.uap:major = {"2011"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+ \(;(Samsung);SmartTV([0-9]{4});.{0,200}FXPDEUC") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = {"UE40F7000"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+ \(;(Samsung);SmartTV([0-9]{4});.{0,200}MST12DEUC") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = {"UE32F4500"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/1\.1\.1 \(; (Philips);.{0,200}NETTV/4") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2013"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/1\.1\.1 \(; (Philips);.{0,200}NETTV/3") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2012"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/1\.1\.1 \(; (Philips);.{0,200}NETTV/2") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2011"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+.{0,100}(firetv)-firefox-plugin (\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"FireHbbTV"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "HbbTV/\d+\.\d+\.\d+ \(.{0,30}; ?([a-zA-Z]+) ?;.{0,30}(201[1-9]).{0,30}\)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "AspiegelBot|PetalBot") {
    set req.http.uap:family = {"Other"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows Phone) (?:OS[ /])?(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CPU[ +]OS|iPhone[ +]OS|CPU[ +]iPhone)[ +]+(\d+)[_\.](\d+)(?:[_\.](\d+)|).{0,100}Outlook-iOS-Android") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "ArcGIS\.?(iOS|Android)-\d+\.\d+(?:\.\d+|)(?:[^\/]{1,50}|)\/(\d+)(?:\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "ArcGISRuntime-(?:Android|iOS)\/\d+\.\d+(?:\.\d+|) \((Android|iOS) (\d+)(?:\.(\d+)(?:\.(\d+)|)|);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) (\d+)(?:\.(\d+)).*CrKey") {
    set req.http.uap:family = {"Chromecast Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Fuchsia.*(CrKey)(?:[/](\d+)\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"Chromecast Fuchsia"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Linux.*(CrKey)(?:[/](\d+)\.(\d+)(?:\.(\d+)|)|).*DeviceType/SmartSpeaker") {
    set req.http.uap:family = {"Chromecast SmartSpeaker"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Linux.*(CrKey)(?:[/](\d+)\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"Chromecast Linux"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android)[ \-/](\d+)(?:\.(\d+)|)(?:[.\-]([a-z0-9]+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) Donut") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) Eclair") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) Froyo") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) Gingerbread") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) Honeycomb") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = {"3"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android) (\d+);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Android): (\d+)(?:\.(\d+)(?:\.(\d+)|)|);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^UCWEB.{0,200}; (Adr) (\d+)\.(\d+)(?:[.\-]([a-z0-9]{1,100})|);") {
    set req.http.uap:family = {"Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^UCWEB.{0,200}; (iPad|iPh|iPd) OS (\d+)_(\d+)(?:_(\d+)|);") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^UCWEB.{0,200}; (wds) (\d+)\.(\d+)(?:\.(\d+)|);") {
    set req.http.uap:family = {"Windows Phone"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^(JUC).{0,200}; ?U; ?(?:Android|)(\d+)\.(\d+)(?:[\.\-]([a-z0-9]{1,100})|)") {
    set req.http.uap:family = {"Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(android)\s(?:mobile\/)(\d+)(?:\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = {"Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Quest") {
    set req.http.uap:family = {"Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Silk-Accelerated=[a-z]{4,5})") {
    set req.http.uap:family = {"Android"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(x86_64|aarch64)\ (\d+)\.(\d+)\.(\d+).{0,100}Chrome.{0,100}(?:CitrixChromeApp)$") {
    set req.http.uap:family = {"Chrome OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(XBLWP7)") {
    set req.http.uap:family = {"Windows Phone"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows ?Mobile)") {
    set req.http.uap:family = {"Windows Mobile"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows 10)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows (?:NT 5\.2|NT 5\.1))") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"XP"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win(?:dows NT |32NT\/)6\.1)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"7"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win(?:dows NT |32NT\/)6\.0)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"Vista"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win 9x 4\.90)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"ME"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows NT 6\.2; ARM;)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"RT"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win(?:dows NT |32NT\/)6\.2)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows NT 6\.3; ARM;)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"RT 8"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win(?:dows NT |32NT\/)6\.3)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Win(?:dows NT |32NT\/)6\.4)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows NT 10\.0)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows NT 5\.0)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"2000"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(WinNT4.0)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"NT 4.0"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows ?CE)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"CE"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Win(?:dows)? ?(95|98|3.1|NT|ME|2000|XP|Vista|7|CE)") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {""} re.group.1 {""};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Win16") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"3.1"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Win32") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {"95"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^Box.{0,200}Windows/([\d.]+);") {
    set req.http.uap:family = {"Windows"};
    set req.http.uap:major = {""} re.group.1 {""};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Tizen)[/ ](\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Intel Mac OS X.+(CriOS|EdgiOS)/\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "((?:Mac[ +]?|; )OS[ +]X)[\s+/](?:(\d+)[_.](\d+)(?:[_.](\d+)|)|Mach-O)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Mac OS X\s.{1,50}\s(\d+).(\d+).(\d+)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {""} re.group.1 {""};
    set req.http.uap:minor = {""} re.group.2 {""};
    set req.http.uap:patch = {""} re.group.3 {""};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ " (Dar)(win)/(9).(\d+).{0,100}\((?:i386|x86_64|Power Macintosh)\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"5"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ " (Dar)(win)/(10).(\d+).{0,100}\((?:i386|x86_64)\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"6"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ " (Dar)(win)/(11).(\d+).{0,100}\((?:i386|x86_64)\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"7"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ " (Dar)(win)/(12).(\d+).{0,100}\((?:i386|x86_64)\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"8"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ " (Dar)(win)/(13).(\d+).{0,100}\((?:i386|x86_64)\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"9"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Mac_PowerPC") {
    set req.http.uap:family = {"Mac OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(?:PPC|Intel) (Mac OS X)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^Box.{0,200};(Darwin)/(10)\.(1\d)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "darwin; arm64") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Apple\s?TV)(?:/(\d+)\.(\d+)|)") {
    set req.http.uap:family = {"ATV OS X"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CPU[ +]OS|iPhone[ +]OS|CPU[ +]iPhone|CPU IPhone OS|CPU iPad OS)[ +]+(\d+)[_\.](\d+)(?:[_\.](\d+)|)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(iPhone|iPad|iPod); Opera") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(iPhone|iPad|iPod).{0,100}Mac OS X.{0,100}Version/(\d+)\.(\d+)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(5)48\.0\.3.{0,100} Darwin/11\.0\.0") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(5)48\.(0)\.4.{0,100} Darwin/(1)1\.0\.0") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(5)48\.(1)\.4") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(4)85\.1(3)\.9") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(6)09\.(1)\.4") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/(6)(0)9") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/6(7)2\.(1)\.13") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/6(7)2\.(1)\.(1)4") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/6(7)(2)\.1\.15") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"7"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/6(7)2\.(0)\.(?:2|8)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CFNetwork)/709\.1") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = {"0.b5"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/711\.(\d)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/(720)\.(\d)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"10"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/(760)\.(\d)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"11"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/7.{0,100} Darwin/15\.4\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"1"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/7.{0,100} Darwin/15\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"2"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/7.{0,100} Darwin/15\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"5"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/758\.(\d)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/808\.3 Darwin/16\.3\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = {"1"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CF)(Network)/808\.(\d)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/17\.\d+.{0,100}\(x86_64\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"13"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/16\.\d+.{0,100}\(x86_64\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"12"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/15\.\d+.{0,100}\(x86_64\)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"11"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(9)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(10)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"4"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(11)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"5"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(13)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"6"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/6.{0,100} Darwin/(14)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"7"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/7.{0,100} Darwin/(14)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"8"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/7.{0,100} Darwin/(15)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"9"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/16\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/16\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"2"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/16\.7\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"3"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/(16)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"10"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/17\.0\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/17\.2\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/17\.3\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/17\.4\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = {"6"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/17\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/17\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/17\.7\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = {"1"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/8.{0,100} Darwin/(17)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"11"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/18\.0\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/18\.2\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/18\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/18\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/18\.7\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/9.{0,100} Darwin/(18)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"12"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/11.{0,100} Darwin/19\.2\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/11.{0,100} Darwin/19\.3\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = {"1"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/11.{0,100} Darwin/19\.4\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/11.{0,100} Darwin/19\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = {"5"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/11.{0,100} Darwin/19\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = {"6"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/1[01].{0,100} Darwin/19\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"13"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.1\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.2\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.3\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.4\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"5"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"6"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/12.{0,100} Darwin/20\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = {"8"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(20)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"14"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.0\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.1\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.2\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.3\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.4\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.5\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"5"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/13.{0,100} Darwin/21\.6\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = {"6"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(21)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"15"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/22\.([0-5])\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"16"};
    set req.http.uap:minor = {""} re.group.1 {""};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(22)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"16"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/23\.([0-5])\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"17"};
    set req.http.uap:minor = {""} re.group.1 {""};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(23)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"17"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/24\.([0-5])\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"18"};
    set req.http.uap:minor = {""} re.group.1 {""};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/(24)\.\d+") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = {"18"};
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\b(iOS[ /]|iOS; |iPhone(?:/| v|[ _]OS[/,]|; | OS : |\d,\d/|\d,\d; )|iPad/)(\d{1,2})[_\.](\d{1,2})(?:[_\.](\d+)|)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((iOS);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(watchOS)[/ ](\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"WatchOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Outlook-(iOS)/\d+\.\d+\.prod\.iphone") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(iPod|iPhone|iPad)") {
    set req.http.uap:family = {"iOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(tvOS)[/ ](\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"tvOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(CrOS) [a-z0-9_]+ (\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"Chrome OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "([Dd]ebian)") {
    set req.http.uap:family = {"Debian"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Linux Mint)(?:/(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Mandriva)(?: Linux|)/(?:[\d.-]+m[a-z]{2}(\d+).(\d)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Symbian[Oo][Ss])[/ ](\d+)\.(\d+)") {
    set req.http.uap:family = {"Symbian OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Symbian/3).{1,200}NokiaBrowser/7\.3") {
    set req.http.uap:family = {"Symbian^3 Anna"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Symbian/3).{1,200}NokiaBrowser/7\.4") {
    set req.http.uap:family = {"Symbian^3 Belle"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Symbian/3)") {
    set req.http.uap:family = {"Symbian^3"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\b(Series 60|SymbOS|S60Version|S60V\d|S60\b)") {
    set req.http.uap:family = {"Symbian OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(MeeGo)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Symbian [Oo][Ss]") {
    set req.http.uap:family = {"Symbian OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Series40;") {
    set req.http.uap:family = {"Nokia Series 40"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "Series30Plus;") {
    set req.http.uap:family = {"Nokia Series 30 Plus"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(BB10);.{1,200}Version/(\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"BlackBerry OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Black[Bb]erry)[0-9a-z]+/(\d+)\.(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"BlackBerry OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Black[Bb]erry).{1,200}Version/(\d+)\.(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"BlackBerry OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(RIM Tablet OS) (\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"BlackBerry Tablet OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Play[Bb]ook)") {
    set req.http.uap:family = {"BlackBerry Tablet OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Black[Bb]erry)") {
    set req.http.uap:family = {"BlackBerry OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(K[Aa][Ii]OS)\/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"KaiOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/18.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = {"1"};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/18.1 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/26.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"2"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/28.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"3"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/30.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"1"};
    set req.http.uap:minor = {"4"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/32.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"0"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Gecko/34.0 Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = {"2"};
    set req.http.uap:minor = {"1"};
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((?:Mobile|Tablet);.{1,200}Firefox/\d+\.\d+") {
    set req.http.uap:family = {"Firefox OS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(BREW)[ /](\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(BREW);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Brew MP|BMP)[ /](\d+)\.(\d+)\.(\d+)") {
    set req.http.uap:family = {"Brew MP"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "BMP;") {
    set req.http.uap:family = {"Brew MP"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(GoogleTV)(?: (\d+)\.(\d+)(?:\.(\d+)|)|/[\da-z]+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(WebTV)/(\d+).(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(hpw|web)OS/(\d+)\.(\d+)(?:\.(\d+)|)") {
    set req.http.uap:family = {"webOS"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(VRE);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Fedora|Red Hat|PCLinuxOS|Puppy|Ubuntu|Kindle|Bada|Sailfish|Lubuntu|BackTrack|Slackware|(?:Free|Open|Net|\b)BSD)[/ ](\d+)\.(\d+)(?:\.(\d+)|)(?:\.(\d+)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Linux)[ /](\d+)\.(\d+)(?:\.(\d+)|).{0,100}gentoo") {
    set req.http.uap:family = {"Gentoo"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((Bada);") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Windows|Android|WeTab|Maemo|Web0S)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Ubuntu|Kubuntu|Arch Linux|CentOS|Slackware|Gentoo|openSUSE|SUSE|Red Hat|Fedora|PCLinuxOS|Mageia|SerenityOS|(?:Free|Open|Net|\b)BSD)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(Linux)(?:[ /](\d+)\.(\d+)(?:\.(\d+)|)|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "SunOS") {
    set req.http.uap:family = {"Solaris"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\(linux-gnu\)") {
    set req.http.uap:family = {"Linux"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\(x86_64-redhat-linux-gnu\)") {
    set req.http.uap:family = {"Red Hat"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "\((freebsd)(\d+)\.(\d+)\)") {
    set req.http.uap:family = {"FreeBSD"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "linux") {
    set req.http.uap:family = {"Linux"};
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "^(Roku)/DVP-(\d+)\.(\d+)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "os\/macos[#]?(\d*)[.]?(\d*)[.]?(\d*)") {
    set req.http.uap:family = {"Mac OS X"};
    set req.http.uap:major = {""} re.group.1 {""};
    set req.http.uap:minor = {""} re.group.2 {""};
    set req.http.uap:patch = {""} re.group.3 {""};
    set req.http.uap:patchMinor = re.group.5;
  } else if (req.http.user-agent ~ "(HarmonyOS)[\s;]+(\d+|)\.?(\d+|)\.?(\d+|)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:major = re.group.2;
    set req.http.uap:minor = re.group.3;
    set req.http.uap:patch = re.group.4;
    set req.http.uap:patchMinor = re.group.5;
  } else {
  }

  set var.result = req.http.uap;
  unset req.http.uap;

  return var.result;
}


sub get_useragent_device STRING {
  declare local var.result STRING;
  set req.http.uap = "";

  if (req.http.user-agent ~ "^.{0,100}?(?:(?:iPhone|Windows CE|Windows Phone|Android).{0,300}(?:(?:Bot|Yeti)-Mobile|YRSpider|BingPreview|bots?/\d|(?:bot|spider)\.html|Google-InspectionTool)|AdsBot-Google-Mobile.{0,200}iPhone)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "^.{0,100}?(?:DoCoMo|\bMOT\b|\bLG\b|Nokia|Samsung|SonyEricsson).{0,200}(?:(?:Bot|Yeti)-Mobile|bots?/\d|(?:bot|crawler)\.html|(?:jump|google|Wukong)bot|ichiro/mobile|/spider|YahooSeeker)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ " PTST/\d+(?:\.\d+|)$") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "X11; Datanyze; Linux") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "Mozilla.{1,100}Mobile.{1,100}(AspiegelBot|PetalBot)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "Mozilla.{0,200}(AspiegelBot|PetalBot)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = {"Desktop"};
  } else if (req.http.user-agent ~ "\bSmartWatch {0,2}\( {0,2}([^;]{1,200}) {0,2}; {0,2}([^;]{1,200}) {0,2};") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "Android Application[^\-]{1,300} - (Sony) ?(Ericsson|) (.{1,200}) \w{1,20} - ") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:model = {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "Android Application[^\-]{1,300} - (?:HTC|HUAWEI|LGE|LENOVO|MEDION|TCT) (HTC|HUAWEI|LG|LENOVO|MEDION|ALCATEL)[ _\-](.{1,200}) \w{1,20} - ") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "Android Application[^\-]{1,300} - ([^ ]+) (.{1,200}) \w{1,20} - ") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([BLRQ]C\d{4}[A-Z]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"3Q "} re.group.1 {""};
    set req.http.uap:brand = {"3Q"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:3Q_)([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"3Q "} re.group.1 {""};
    set req.http.uap:brand = {"3Q"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android [34].{0,200}; {0,2}(A100|A101|A110|A200|A210|A211|A500|A501|A510|A511|A700(?: Lite| 3G|)|A701|B1-A71|A1-\d{3}|B1-\d{3}|V360|V370|W500|W500P|W501|W501P|W510|W511|W700|Slider SL101|DA22[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Acer"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Acer Iconia Tab ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Acer"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Z1[1235]0|E320[^/]{0,10}|S500|S510|Liquid[^;/]{0,30}|Iconia A\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Acer"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Acer |ACER )([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Acer"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Advent |)(Vega(?:Bean|Comb|)).{0,200}?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Advent"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Ainol |)((?:NOVO|[Nn]ovo)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Ainol"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}AIRIS[ _\-]?([^/;\)]+) {0,2}(?:;|\)|Build)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Airis"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(OnePAD[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Airis"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Airpad[ \-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Airpad "} re.group.1 {""};
    set req.http.uap:brand = {"Airpad"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(one ?touch) (EVO7|T10|T20)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Alcatel One Touch "} re.group.2 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {"One Touch "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:alcatel[ _]|)(?:(?:one[ _]?touch[ _])|ot[ \-])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Alcatel One Touch "} re.group.1 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {"One Touch "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TCL)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Vodafone Smart II|Optimus_Madrid)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Alcatel "} re.group.1 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}BASE_Lutea_3(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Alcatel One Touch 998"};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {"One Touch 998"};
  } else if (req.http.user-agent ~ "; {0,2}BASE_Varia(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Alcatel One Touch 918D"};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {"One Touch 918D"};
  } else if (req.http.user-agent ~ "; {0,2}((?:FINE|Fine)\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Allfine"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ALLVIEW[ _]?|Allview[ _]?)((?:Speed|SPEED).{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Allview"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ALLVIEW[ _]?|Allview[ _]?|)(AX1_Shine|AX2_Frenzy)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Allview"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ALLVIEW[ _]?|Allview[ _]?)([^;/]*?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Allview"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A13-MID)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Allwinner"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Allwinner)[ _\-]?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Allwinner"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A651|A701B?|A702|A703|A705|A706|A707|A711|A712|A713|A717|A722|A785|A801|A802|A803|A901|A902|A1002|A1003|A1006|A1007|A9701|A9703|Q710|Q80)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Amaway"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:AMOI|Amoi)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Amoi "} re.group.1 {""};
    set req.http.uap:brand = {"Amoi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^(?:AMOI|Amoi)[ _]([^;/]{1,100}?) Linux") {
    set req.http.uap:family = {"Amoi "} re.group.1 {""};
    set req.http.uap:brand = {"Amoi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MW(?:0[789]|10)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Aoc"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(G7|M1013|M1015G|M11[CG]?|M-?12[B]?|M15|M19[G]?|M30[ACQ]?|M31[GQ]|M32|M33[GQ]|M36|M37|M38|M701T|M710|M712B|M713|M715G|M716G|M71(?:G|GS|T|)|M72[T]?|M73[T]?|M75[GT]?|M77G|M79T|M7L|M7LN|M81|M810|M81T|M82|M92|M92KS|M92S|M717G|M721|M722G|M723|M725G|M739|M785|M791|M92SK|M93D)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Aoson "} re.group.1 {""};
    set req.http.uap:brand = {"Aoson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Aoson ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Aoson "} re.group.1 {""};
    set req.http.uap:brand = {"Aoson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}[Aa]panda[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Apanda "} re.group.1 {""};
    set req.http.uap:brand = {"Apanda"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:ARCHOS|Archos) ?(GAMEPAD.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Archos "} re.group.1 {""};
    set req.http.uap:brand = {"Archos"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "ARCHOS; GOGI; ([^;]{1,200});") {
    set req.http.uap:family = {"Archos "} re.group.1 {""};
    set req.http.uap:brand = {"Archos"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:ARCHOS|Archos)[ _]?(.{0,200}?)(?: Build|[;/\(\)\-]|$)") {
    set req.http.uap:family = {"Archos "} re.group.1 {""};
    set req.http.uap:brand = {"Archos"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(AN(?:7|8|9|10|13)[A-Z0-9]{1,4})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Archos "} re.group.1 {""};
    set req.http.uap:brand = {"Archos"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A28|A32|A43|A70(?:BHT|CHT|HB|S|X)|A101(?:B|C|IT)|A7EB|A7EB-WK|101G9|80G9)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Archos "} re.group.1 {""};
    set req.http.uap:brand = {"Archos"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PAD-FMD[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Arival"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(BioniQ) ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Arival"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(AN\d[^;/]{1,100}|ARCHM\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Arnova "} re.group.1 {""};
    set req.http.uap:brand = {"Arnova"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:ARNOVA|Arnova) ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Arnova "} re.group.1 {""};
    set req.http.uap:brand = {"Arnova"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:ASSISTANT |)(AP)-?([1789]\d{2}[A-Z]{0,2}|80104)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Assistant "} re.group.1 {"-"} re.group.2 {""};
    set req.http.uap:brand = {"Assistant"};
    set req.http.uap:model = {""} re.group.1 {"-"} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ME17\d[^;/]*|ME3\d{2}[^;/]{1,100}|K00[A-Z]|Nexus 10|Nexus 7(?: 2013|)|PadFone[^;/]*|Transformer[^;/]*|TF\d{3}[^;/]*|eeepc)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}ASUS[ _]{0,10}([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Garmin-Asus ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Garmin-Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Garmin-Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Garminfone)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Garmin "} re.group.1 {""};
    set req.http.uap:brand = {"Garmin-Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (@TAB-[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Attab"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T-(?:07|[^0]\d)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Audiosonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Axioo[ _\-]([^;/]{1,100}?)|(picopad)[ _\-]([^;/]{1,100}?))(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Axioo "} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Axioo"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(V(?:100|700|800)[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Azend"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IBAK\-[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Bak"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(HY5001|HY6501|X12|X21|I5)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Bedove "} re.group.1 {""};
    set req.http.uap:brand = {"Bedove"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(JC-[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Benss "} re.group.1 {""};
    set req.http.uap:brand = {"Benss"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(BB) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Blackberry"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(BlackBird)[ _](I8.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(BlackBird)[ _](.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([0-9]+BP[EM][^;/]*|Endeavour[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Blaupunkt "} re.group.1 {""};
    set req.http.uap:brand = {"Blaupunkt"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:BLU|Blu)[ _\-])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Blu"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:BMOBILE )?(Blu|BLU|DASH [^;/]{1,100}|VIVO 4\.3|TANK 4\.5)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Blu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TOUCH\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Blusens"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(AX5\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Bmobile"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([Bb]q) ([^;/]{1,100}?);?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"bq"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Maxwell [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"bq"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:B-Tab|B-TAB) ?\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Braun"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Broncho) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}CAPTIVA ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Captiva "} re.group.1 {""};
    set req.http.uap:brand = {"Captiva"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(C771|CAL21|IS11CA)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Casio"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Cat|CAT) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Cat "} re.group.1 {""};
    set req.http.uap:brand = {"Cat"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Cat)(Nova.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Cat "} re.group.1 {""};
    set req.http.uap:brand = {"Cat"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(INM8002KP|ADM8000KP_[AB])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Cat"};
    set req.http.uap:model = {"Tablet PHOENIX 8.1J0"};
  } else if (req.http.user-agent ~ "; {0,2}(?:[Cc]elkon[ _\*]|CELKON[ _\*])([^;/\)]+) ?(?:Build|;|\))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Celkon"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Build/(?:[Cc]elkon)+_?([^;/_\)]+)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Celkon"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(CT)-?(\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Celkon"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A19|A19Q|A105|A107[^;/\)]*) ?(?:Build|;|\))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Celkon"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TPC[0-9]{4,5})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ChangJia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "CrKey.*DeviceType/([^/]*)") {
    set req.http.uap:family = {"Chromecast"};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Fuchsia.*CrKey") {
    set req.http.uap:family = {"Chromecast"};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {"Nest Hub"};
  } else if (req.http.user-agent ~ "Linux.*CrKey/1.36") {
    set req.http.uap:family = {"Chromecast"};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {"First Generation"};
  } else if (req.http.user-agent ~ "CrKey/") {
    set req.http.uap:family = {"Chromecast"};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {"Chromecast"};
  } else if (req.http.user-agent ~ "; {0,2}(Cloudfone)[ _](Excite)([^ ][^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Cloudfone"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Excite|ICE)[ _](\d+[^;/]{0,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Cloudfone "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Cloudfone"};
    set req.http.uap:model = {"Cloudfone "} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Cloudfone|CloudPad)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Cloudfone"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:Aquila|Clanga|Rapax)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Cmx"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:CFW-|Kyros )?(MID[0-9]{4}(?:[ABC]|SR|TV)?)(\(3G\)-4G| GB 8K| 3G| 8K| GB)? {0,2}(?:Build|[;\)])") {
    set req.http.uap:family = {"CobyKyros "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"CobyKyros"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;/]{0,50})Coolpad[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Coolpad"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(CUBE[ _])?([KU][0-9]+ ?GT.{0,200}?|A5300)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Cube"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}CUBOT ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Cubot"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(BOBBY)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Cubot"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Dslide [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Danew"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(XCD)[ _]?(28|35)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(001DL)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {"Streak"};
  } else if (req.http.user-agent ~ "; {0,2}(?:Dell|DELL) (Streak)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {"Streak"};
  } else if (req.http.user-agent ~ "; {0,2}(101DL|GS01|Streak Pro[^;/]{0,100})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {"Streak Pro"};
  } else if (req.http.user-agent ~ "; {0,2}([Ss]treak ?7)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {"Streak 7"};
  } else if (req.http.user-agent ~ "; {0,2}(Mini-3iX)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Dell|DELL)[ _](Aero|Venue|Thunder|Mini.{0,200}?|Streak[ _]Pro)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Dell[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TA[CD]-\d+[^;/]{0,100})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Denver"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(iP[789]\d{2}(?:-3G)?|IP10\d{2}(?:-8GB)?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Dex"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(AirTab)[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"DNS"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(F\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Fujitsu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(HT-03A)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"Magic"};
  } else if (req.http.user-agent ~ "; {0,2}(HT\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(L\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(N\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Nec"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(P\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Panasonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SC\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SH\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sharp"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SO\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T\-0[12][^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Toshiba"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(DOOV)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"DOOV"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Enot|ENOT)[ -]?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Enot"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}[^;/]{1,100} Build/(?:CROSS|Cross)+[ _\-]([^\)]+)") {
    set req.http.uap:family = {"CROSS "} re.group.1 {""};
    set req.http.uap:brand = {"Evercoss"};
    set req.http.uap:model = {"Cross "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(CROSS|Cross)[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Evercoss"};
    set req.http.uap:model = {"Cross "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}Explay[_ ](.{1,200}?)(?:[\)]| Build)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Explay"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IQ.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Fly"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Fly|FLY)[ _](IQ[^;]{1,100}?|F[34]\d+[^;]{0,100}?);?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Fly"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M532|Q572|FJL21)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Fujitsu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(G1)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Galapad"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Geeksphone) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(G[^F]?FIVE) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Gfive"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Gionee)[ _\-]([^;/]{1,100}?)(?:/[^;/]{1,100}|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Gionee"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(GN\d+[A-Z]?|INFINITY_PASSION|Ctrl_V1)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Gionee "} re.group.1 {""};
    set req.http.uap:brand = {"Gionee"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(E3) Build/JOP40D") {
    set req.http.uap:family = {"Gionee "} re.group.1 {""};
    set req.http.uap:brand = {"Gionee"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\sGIONEE[-\s_](\w*)") {
    set req.http.uap:family = {"Gionee "} re.group.1 {""};
    set req.http.uap:brand = {"Gionee"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:FONE|QUANTUM|INSIGNIA) \d+[^;/]{0,100}|PLAYTAB)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"GoClever "} re.group.1 {""};
    set req.http.uap:brand = {"GoClever"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}GOCLEVER ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"GoClever "} re.group.1 {""};
    set req.http.uap:brand = {"GoClever"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Glass \d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([g|G]oogle)? (Pixel[ a-zA-z0-9]{1,100});(?: Build|.{0,50}\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.2 {""};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([g|G]oogle)? (Pixel.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.2 {""};
    set req.http.uap:brand = {"Google"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(GSmart)[ -]([^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Gigabyte"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(imx5[13]_[^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Freescale "} re.group.1 {""};
    set req.http.uap:brand = {"Freescale"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Haier[ _\-]([^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Haier "} re.group.1 {""};
    set req.http.uap:brand = {"Haier"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PAD1016)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Haipad "} re.group.1 {""};
    set req.http.uap:brand = {"Haipad"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M701|M7|M8|M9)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Haipad "} re.group.1 {""};
    set req.http.uap:brand = {"Haipad"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SN\d+T[^;\)/]*)(?: Build|[;\)])") {
    set req.http.uap:family = {"Hannspree "} re.group.1 {""};
    set req.http.uap:brand = {"Hannspree"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Build/HCL ME Tablet ([^;\)]{1,3})[\);]") {
    set req.http.uap:family = {"HCLme "} re.group.1 {""};
    set req.http.uap:brand = {"HCLme"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;\/]+) Build/HCL") {
    set req.http.uap:family = {"HCLme "} re.group.1 {""};
    set req.http.uap:brand = {"HCLme"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MID-?\d{4}C[EM])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hena "} re.group.1 {""};
    set req.http.uap:brand = {"Hena"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(EG\d{2,}|HS-[^;/]{1,100}|MIRA[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hisense "} re.group.1 {""};
    set req.http.uap:brand = {"Hisense"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(andromax[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hisense "} re.group.1 {""};
    set req.http.uap:brand = {"Hisense"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:AMAZE[ _](S\d+)|(S\d+)[ _]AMAZE)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"AMAZE "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"hitech"};
    set req.http.uap:model = {"AMAZE "} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PlayBook)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"HP "} re.group.1 {""};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}HP ([^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"HP "} re.group.1 {""};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^/]{1,30}_tenderloin)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"HP TouchPad"};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {"TouchPad"};
  } else if (req.http.user-agent ~ "; {0,2}(HUAWEI |Huawei-|)([UY][^;/]{1,100}) Build/(?:Huawei|HUAWEI)([UY][^\);]+)\)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;/]{1,100}) Build[/ ]Huawei(MT1-U06|[A-Z]{1,50}\d+[^\);]{1,50})\)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(S7|M860) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:HUAWEI|Huawei)[ \-]?)(MediaPad) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:HUAWEI[ _]?|Huawei[ _]|)Ascend[ _])([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:HUAWEI|Huawei)[ _\-]?)((?:G700-|MT-)[^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:HUAWEI|Huawei)[ _\-]?)([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MediaPad[^;]{1,200}|SpringBoard) Build/Huawei") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;]{1,200}) Build/(?:Huawei|HUAWEI)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([Uu])([89]\d{3}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"U"} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Ideos |IDEOS )(S7) Build") {
    set req.http.uap:family = {"Huawei Ideos"} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"Ideos"} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Ideos |IDEOS )([^;/]{1,50}\s{0,5}|\s{0,5})Build") {
    set req.http.uap:family = {"Huawei Ideos"} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"Ideos"} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Orange Daytona|Pulse|Pulse Mini|Vodafone 858|C8500|C8600|C8650|C8660|Nexus 6P|ATH-.{1,200}?) Build[/ ]") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:[A-Z]{3})\-L[A-Za0-9]{2})[\)]") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;]{1,200}) Build/(HONOR|Honor)") {
    set req.http.uap:family = {"Huawei Honor "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"Honor "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}HTC[ _]([^;]{1,200}); Windows Phone") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:HTC[ _/])+([^ _/]+)(?:[/\\]1\.0 | V|/| +)\d+\.\d[\d\.]*(?: {0,2}Build|\))") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:HTC[ _/])+([^ _/]+)(?:[ _/]([^ _/]+)|)(?:[/\\]1\.0 | V|/| +)\d+\.\d[\d\.]*(?: {0,2}Build|\))") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:HTC[ _/])+([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ _/]+)|)|)(?:[/\\]1\.0 | V|/| +)\d+\.\d[\d\.]*(?: {0,2}Build|\))") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:HTC[ _/])+([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ _/]+)|)|)|)(?:[/\\]1\.0 | V|/| +)\d+\.\d[\d\.]*(?: {0,2}Build|\))") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(?:HTC|htc)(?:_blocked|)[ _/])+([^ _/;]+)(?: {0,2}Build|[;\)]| - )") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(?:HTC|htc)(?:_blocked|)[ _/])+([^ _/]+)(?:[ _/]([^ _/;\)]+)|)(?: {0,2}Build|[;\)]| - )") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(?:HTC|htc)(?:_blocked|)[ _/])+([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ _/;\)]+)|)|)(?: {0,2}Build|[;\)]| - )") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(?:HTC|htc)(?:_blocked|)[ _/])+([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ _/]+)(?:[ _/]([^ /;]+)|)|)|)(?: {0,2}Build|[;\)]| - )") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
  } else if (req.http.user-agent ~ "HTC Streaming Player [^\/]{0,30}/[^\/]{0,10}/ htc_([^/]{1,10}) /") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:[;,] {0,2}|^)(?:htccn_chs-|)HTC[ _-]?([^;]{1,200}?)(?: {0,2}Build|clay|Android|-?Mozilla| Opera| Profile| UNTRUSTED|[;/\(\)]|$)") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A6277|ADR6200|ADR6300|ADR6350|ADR6400[A-Z]*|ADR6425[A-Z]*|APX515CKT|ARIA|Desire[^_ ]*|Dream|EndeavorU|Eris|Evo|Flyer|HD2|Hero|HERO200|Hero CDMA|HTL21|Incredible|Inspire[A-Z0-9]*|Legend|Liberty|Nexus ?(?:One|HD2)|One|One S C2|One[ _]?(?:S|V|X\+?)\w*|PC36100|PG06100|PG86100|S31HT|Sensation|Wildfire)(?: Build|[/;\(\)])") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ADR6200|ADR6400L|ADR6425LVW|Amaze|DesireS?|EndeavorU|Eris|EVO|Evo\d[A-Z]+|HD2|IncredibleS?|Inspire[A-Z0-9]*|Sensation[A-Z0-9]*|Wildfire)[ _-](.{1,200}?)(?:[/;\)]|Build|MIUI|1\.0)") {
    set req.http.uap:family = {"HTC "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}HYUNDAI (T\d[^/]{0,10})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hyundai "} re.group.1 {""};
    set req.http.uap:brand = {"Hyundai"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}HYUNDAI ([^;/]{1,10}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hyundai "} re.group.1 {""};
    set req.http.uap:brand = {"Hyundai"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(X700|Hold X|MB-6900)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Hyundai "} re.group.1 {""};
    set req.http.uap:brand = {"Hyundai"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:iBall[ _\-]|)(Andi)[ _]?(\d[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"iBall"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IBall)(?:[ _]([^;/]{1,100}?)|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"iBall"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(NT-\d+[^ ;/]{0,50}|Net[Tt]AB [^;/]{1,50}|Mercury [A-Z]{1,50}|iconBIT)(?: S/N:[^;/]{1,50}|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"IconBIT"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IMO)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"IMO"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}i-?mobile[ _]([^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"i-mobile "} re.group.1 {""};
    set req.http.uap:brand = {"imobile"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(i-(?:style|note)[^/]{0,10})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"i-mobile "} re.group.1 {""};
    set req.http.uap:brand = {"imobile"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ImPAD) ?(\d+(?:.){0,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Impression"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Infinix)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Infinix"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Informer)[ \-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Informer"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TAB) ?([78][12]4)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Intenso "} re.group.1 {""};
    set req.http.uap:brand = {"Intenso"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Intex[ _]|)(AQUA|Aqua)([ _\.\-])([^;/]{1,100}?) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Intex"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:INTEX|Intex)(?:[_ ]([^\ _;/]+))(?:[_ ]([^\ _;/]+)|) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Intex"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}([iI]Buddy)[ _]?(Connect)(?:_|\?_| |)([^;/]{0,50}) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Intex"};
    set req.http.uap:model = {"iBuddy "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(I-Buddy)[ _]([^;/]{1,100}?) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Intex"};
    set req.http.uap:model = {"iBuddy "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(iOCEAN) ([^/]{1,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"iOCEAN"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TP\d+(?:\.\d+|)\-\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"ionik "} re.group.1 {""};
    set req.http.uap:brand = {"ionik"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M702pro)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Iru"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}itel ([^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Itel "} re.group.1 {""};
    set req.http.uap:brand = {"Itel"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(DE88Plus|MD70)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Ivio"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}IVIO[_\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Ivio"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TPC-\d+|JAY-TECH)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Jaytech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(JY-[^;/]{1,100}|G[234]S?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Jiayu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(JXD)[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"JXD"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}Karbonn[ _]?([^;/]{1,100}) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Karbonn"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([^;]{1,200}) Build/Karbonn") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Karbonn"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A11|A39|A37|A34|ST8|ST10|ST7|Smart Tab3|Smart Tab2|Titanium S\d) +Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Karbonn"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS01|IS03|IS05|IS\d{2}SH)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sharp"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS04)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Regza"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS06|IS\d{2}PT)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS11S)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {"Xperia Acro"};
  } else if (req.http.user-agent ~ "; {0,2}(IS11CA)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Casio"};
    set req.http.uap:model = {"GzOne "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS11LG)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {"Optimus X"};
  } else if (req.http.user-agent ~ "; {0,2}(IS11N)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Medias"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IS11PT)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {"MIRACH"};
  } else if (req.http.user-agent ~ "; {0,2}(IS12F)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Fujitsu"};
    set req.http.uap:model = {"Arrows ES"};
  } else if (req.http.user-agent ~ "; {0,2}(IS12M)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {"XT909"};
  } else if (req.http.user-agent ~ "; {0,2}(IS12S)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {"Xperia Acro HD"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW11F)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Fujitsu"};
    set req.http.uap:model = {"Arrowz Z"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW11HT)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"EVO"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW11K)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Kyocera"};
    set req.http.uap:model = {"DIGNO"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW11M)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {"Photon"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW11SC)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {"GALAXY S II WiMAX"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW12HT)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"EVO 3D"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW13HT)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"J"};
  } else if (req.http.user-agent ~ "; {0,2}(ISW?[0-9]{2}[A-Z]{0,2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"KDDI"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(INFOBAR [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"KDDI"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(JOYPAD|Joypad)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Kingcom"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Vox|VOX|Arc|K080)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Kobo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\b(Kobo Touch)\b") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Kobo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(K-Touch)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Ktouch"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:EV|KM)-S\d+[A-Z]?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"KTtech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Zio|Hydro|Torque|Event|EVENT|Echo|Milano|Rise|URBANO PROGRESSO|WX04K|WX06K|WX10K|KYL21|101K|C5[12]\d{2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Kyocera"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:LAVA[ _]|)IRIS[ _\-]?([^/;\)]+) {0,2}(?:;|\)|Build)") {
    set req.http.uap:family = {"Iris "} re.group.1 {""};
    set req.http.uap:brand = {"Lava"};
    set req.http.uap:model = {"Iris "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}LAVA[ _]([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Lava"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(Aspire A1)|(?:LEMON|Lemon)[ _]([^;/]{1,100}))_?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Lemon "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Lemon"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TAB-1012)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Lenco "} re.group.1 {""};
    set req.http.uap:brand = {"Lenco"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; Lenco ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Lenco "} re.group.1 {""};
    set req.http.uap:brand = {"Lenco"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A1_07|A2107A-H|S2005A-H|S1-37AH0) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Idea[Tp]ab)[ _]([^;/]{1,100});? Build") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Idea(?:Tab|pad)) ?([^;/]{1,100}) Build") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ThinkPad) ?(Tablet) Build/") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:LNV-|)(?:=?[Ll]enovo[ _\-]?|LENOVO[ _])(.{1,200}?)(?:Build|[;/\)])") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "[;,] (?:Vodafone |)(SmartTab) ?(II) ?(\d+) Build/") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Ideapad |)K1 Build/") {
    set req.http.uap:family = {"Lenovo Ideapad K1"};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {"Ideapad K1"};
  } else if (req.http.user-agent ~ "; {0,2}(3GC101|3GW10[01]|A390) Build/") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\b(?:Lenovo|LENOVO)+[ _\-]?([^,;:/ ]+)") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MFC\d+)[A-Z]{2}([^;,/]*),?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Lexibook"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(E[34][0-9]{2}|LS[6-8][0-9]{2}|VS[6-9][0-9]+[^;/]{1,30}|Nexus 4|Nexus 5X?|GT540f?|Optimus (?:2X|G|4X HD)|OptimusX4HD) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "[;:] {0,2}(L-\d+[A-Z]|LGL\d+[A-Z]?)(?:/V\d+|) {0,2}(?:Build|[;\)])") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(LG-)([A-Z]{1,2}\d{2,}[^,;/\)\(]*?)(?:Build| V\d+|[,;/\)\(]|$)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(LG[ \-]|LG)([^;/]{1,100})[;/]? Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "^(LG)-([^;/]{1,100})/ Mozilla/.{0,200}; Android") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(Web0S); Linux/(SmartTV)") {
    set req.http.uap:family = {"LG "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:SMB|smb)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Malata"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Malata|MALATA) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Malata"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MS[45][0-9]{3}|MID0[568][NS]?|MID[1-9]|MID[78]0[1-9]|MID970[1-9]|MID100[1-9])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Manta"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M1052|M806|M9000|M9100|M9701|MID100|MID120|MID125|MID130|MID135|MID140|MID701|MID710|MID713|MID727|MID728|MID731|MID732|MID733|MID735|MID736|MID737|MID760|MID800|MID810|MID820|MID830|MID833|MID835|MID860|MID900|MID930|MID933|MID960|MID980)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Match"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(GenxDroid7|MSD7.{0,200}?|AX\d.{0,200}?|Tab 701|Tab 722)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Maxx "} re.group.1 {""};
    set req.http.uap:brand = {"Maxx"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M-PP[^;/]{1,30}|PhonePad ?\d{2,}[^;/]{1,30}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Mediacom "} re.group.1 {""};
    set req.http.uap:brand = {"Mediacom"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M-MP[^;/]{1,30}|SmartPad ?\d{2,}[^;/]{1,30}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Mediacom "} re.group.1 {""};
    set req.http.uap:brand = {"Mediacom"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:MD_|)LIFETAB[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Medion Lifetab "} re.group.1 {""};
    set req.http.uap:brand = {"Medion"};
    set req.http.uap:model = {"Lifetab "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}MEDION ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Medion "} re.group.1 {""};
    set req.http.uap:brand = {"Medion"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(M030|M031|M035|M040|M065|m9)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Meizu "} re.group.1 {""};
    set req.http.uap:brand = {"Meizu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:meizu_|MEIZU )(.{1,200}?) {0,2}(?:Build|[;\)])") {
    set req.http.uap:family = {"Meizu "} re.group.1 {""};
    set req.http.uap:brand = {"Meizu"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Quest 3") {
    set req.http.uap:family = {"Quest"};
    set req.http.uap:brand = {"Meta"};
    set req.http.uap:model = {"Quest 3"};
  } else if (req.http.user-agent ~ "Quest 2") {
    set req.http.uap:family = {"Quest"};
    set req.http.uap:brand = {"Meta"};
    set req.http.uap:model = {"Quest 2"};
  } else if (req.http.user-agent ~ "Quest Pro") {
    set req.http.uap:family = {"Quest"};
    set req.http.uap:brand = {"Meta"};
    set req.http.uap:model = {"Quest Pro"};
  } else if (req.http.user-agent ~ "Quest") {
    set req.http.uap:family = {"Quest"};
    set req.http.uap:brand = {"Meta"};
    set req.http.uap:model = {"Quest"};
  } else if (req.http.user-agent ~ "; {0,2}(?:Micromax[ _](A111|A240)|(A111|A240)) Build") {
    set req.http.uap:family = {"Micromax "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Micromax"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}Micromax[ _](A\d{2,3}[^;/]*) Build") {
    set req.http.uap:family = {"Micromax "} re.group.1 {""};
    set req.http.uap:brand = {"Micromax"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A\d{2}|A[12]\d{2}|A90S|A110Q) Build") {
    set req.http.uap:family = {"Micromax "} re.group.1 {""};
    set req.http.uap:brand = {"Micromax"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Micromax[ _](P\d{3}[^;/]*) Build") {
    set req.http.uap:family = {"Micromax "} re.group.1 {""};
    set req.http.uap:brand = {"Micromax"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(P\d{3}|P\d{3}\(Funbook\)) Build") {
    set req.http.uap:family = {"Micromax "} re.group.1 {""};
    set req.http.uap:brand = {"Micromax"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MITO)[ _\-]?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Mito"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Cynus)[ _](F5|T\d|.{1,200}?) {0,2}(?:Build|[;/\)])") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Mobistel"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MODECOM |)(FreeTab) ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Modecom"};
    set req.http.uap:model = {""} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MODECOM )([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Modecom"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MZ\d{3}\+?|MZ\d{3} 4G|Xoom|XOOM[^;/]*) Build") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Milestone )(XT[^;/]*) Build") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Motoroi ?x|Droid X|DROIDX) Build") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {"DROID X"};
  } else if (req.http.user-agent ~ "; {0,2}(Droid[^;/]*|DROID[^;/]*|Milestone[^;/]*|Photon|Triumph|Devour|Titanium) Build") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A555|A85[34][^;/]*|A95[356]|ME[58]\d{2}\+?|ME600|ME632|ME722|MB\d{3}\+?|MT680|MT710|MT870|MT887|MT917|WX435|WX453|WX44[25]|XT\d{3,4}[A-Z\+]*|CL[iI]Q|CL[iI]Q XT) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Motorola MOT-|Motorola[ _\-]|MOT\-?)([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Moto[_ ]?|MOT\-)([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:MP[DQ]C|MPG\d{1,4}|MP\d{3,4}|MID(?:(?:10[234]|114|43|7[247]|8[24]|7)C|8[01]1))[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Mpman"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:MSI[ _]|)(Primo\d+|Enjoy[ _\-][^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Msi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Multilaser[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Multilaser"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(My)[_]?(Pad)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"MyPhone"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(My)\|?(Phone)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"MyPhone"};
    set req.http.uap:model = {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A\d+)[ _](Duo|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"MyPhone"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(myTab[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Mytab"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(NABI2?-)([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Nabi"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(N-\d+[CDE])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Nec"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; ?(NEC-)(.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Nec"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(LT-NA7)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Nec"};
    set req.http.uap:model = {"Lifetouch Note"};
  } else if (req.http.user-agent ~ "; {0,2}(NXM\d+[A-Za-z0-9_]{0,50}|Next\d[A-Za-z0-9_ \-]{0,50}|NEXT\d[A-Za-z0-9_ \-]{0,50}|Nextbook [A-Za-z0-9_ ]{0,50}|DATAM803HC|M805)(?: Build|[\);])") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Nextbook"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Nokia)([ _\-]{0,5})([^;/]{0,50}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TA\-\d{4})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Nook ?|Barnes & Noble Nook |BN )([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Nook"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(NOOK |)(BNRV200|BNRV200A|BNTV250|BNTV250A|BNTV400|BNTV600|LogicPD Zoom2)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Nook"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; Build/(Nook)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Nook"};
    set req.http.uap:model = {"Tablet"};
  } else if (req.http.user-agent ~ "; {0,2}(OP110|OliPad[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Olivetti "} re.group.1 {""};
    set req.http.uap:brand = {"Olivetti"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}OMEGA[ _\-](MID[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Omega "} re.group.1 {""};
    set req.http.uap:brand = {"Omega"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^(MID7500|MID\d+) Mozilla/5\.0 \(iPad;") {
    set req.http.uap:family = {"Omega "} re.group.1 {""};
    set req.http.uap:brand = {"Omega"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:CIUS|cius)[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Openpeak "} re.group.1 {""};
    set req.http.uap:brand = {"Openpeak"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Find ?(?:5|7a)|R8[012]\d{1,2}|T703\d?|U70\d{1,2}T?|X90\d{1,2}|[AFR]\d{1,2}[a-z]{1,2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Oppo "} re.group.1 {""};
    set req.http.uap:brand = {"Oppo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}OPPO ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Oppo "} re.group.1 {""};
    set req.http.uap:brand = {"Oppo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(CPH\d{1,4}|RMX\d{1,4}|P[A-Z]{3}\d{2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Oppo "} re.group.1 {""};
    set req.http.uap:brand = {"Oppo"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "; {0,2}(A1601)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Oppo F1s"};
    set req.http.uap:brand = {"Oppo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Odys\-|ODYS\-|ODYS )([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Odys "} re.group.1 {""};
    set req.http.uap:brand = {"Odys"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SELECT) ?(7)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Odys "} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Odys"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PEDI)_(PLUS)_(W)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Odys "} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Odys"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(AEON|BRAVIO|FUSION|FUSION2IN1|Genio|EOS10|IEOS[^;/]*|IRON|Loox|LOOX|LOOX Plus|Motion|NOON|NOON_PRO|NEXT|OPOS|PEDI[^;/]*|PRIME[^;/]*|STUDYTAB|TABLO|Tablet-PC-4|UNO_X8|XELIO[^;/]*|Xelio ?\d+ ?[Pp]ro|XENO10|XPRESS PRO)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Odys "} re.group.1 {""};
    set req.http.uap:brand = {"Odys"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (ONE [a-zA-Z]\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"OnePlus "} re.group.1 {""};
    set req.http.uap:brand = {"OnePlus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (ONEPLUS [a-zA-Z]\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"OnePlus "} re.group.1 {""};
    set req.http.uap:brand = {"OnePlus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(HD1903|GM1917|IN2025|LE2115|LE2127|HD1907|BE2012|BE2025|BE2026|BE2028|BE2029|DE2117|DE2118|EB2101|GM1900|GM1910|GM1915|HD1905|HD1925|IN2015|IN2017|IN2019|KB2005|KB2007|LE2117|LE2125|BE2015|GM1903|HD1900|HD1901|HD1910|HD1913|IN2010|IN2013|IN2020|LE2111|LE2120|LE2121|LE2123|BE2011|IN2023|KB2003|LE2113|NE2215|DN2101)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"OnePlus "} re.group.1 {""};
    set req.http.uap:brand = {"OnePlus"};
    set req.http.uap:model = {"OnePlus "} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (OnePlus[ a-zA-z0-9]{0,50});((?: Build|.{0,50}\) AppleWebKit))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"OnePlus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (OnePlus[ a-zA-z0-9]{0,50})((?: Build|\) AppleWebKit))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"OnePlus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TP-\d+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Orion "} re.group.1 {""};
    set req.http.uap:brand = {"Orion"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(G100W?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"PackardBell "} re.group.1 {""};
    set req.http.uap:brand = {"PackardBell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Panasonic)[_ ]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(FZ-A1B|JT-B1)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Panasonic "} re.group.1 {""};
    set req.http.uap:brand = {"Panasonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(dL1|DL1)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Panasonic "} re.group.1 {""};
    set req.http.uap:brand = {"Panasonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SKY[ _]|)(IM\-[AT]\d{3}[^;/]{1,100}).{0,30} Build/") {
    set req.http.uap:family = {"Pantech "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:ADR8995|ADR910L|ADR930L|ADR930VW|PTL21|P8000)(?: 4G|)) Build/") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Pantech([^;/]{1,30}).{0,200}? Build/") {
    set req.http.uap:family = {"Pantech "} re.group.1 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(papyre)[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Papyre"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Touchlet )?(X10\.[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Pearl "} re.group.1 {""};
    set req.http.uap:brand = {"Pearl"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; PHICOMM (i800)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Phicomm "} re.group.1 {""};
    set req.http.uap:brand = {"Phicomm"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; PHICOMM ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Phicomm "} re.group.1 {""};
    set req.http.uap:brand = {"Phicomm"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(FWS\d{3}[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Phicomm "} re.group.1 {""};
    set req.http.uap:brand = {"Phicomm"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(D633|D822|D833|T539|T939|V726|W335|W336|W337|W3568|W536|W5510|W626|W632|W6350|W6360|W6500|W732|W736|W737|W7376|W820|W832|W8355|W8500|W8510|W930)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Philips"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Philips|PHILIPS)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Philips "} re.group.1 {""};
    set req.http.uap:brand = {"Philips"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android 4\..{0,200}; {0,2}(M[12356789]|U[12368]|S[123])\ ?(pro)?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Pipo "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Pipo"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MOMO[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Ployer"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Polaroid[ _]|)((?:MIDC\d{3,}|PMID\d{2,}|PTAB\d{3,})[^;/]{0,30}?)(\/[^;/]{0,30}|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Polaroid"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Polaroid )(Tablet)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Polaroid"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(POMP)[ _\-](.{1,200}?) {0,2}(?:Build|[;/\)])") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Pomp"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TB07STA|TB10STA|TB07FTA|TB10FTA)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Positivo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Positivo |)((?:YPY|Ypy)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Positivo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MOB-[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"POV"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}POV[ _\-]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"POV "} re.group.1 {""};
    set req.http.uap:brand = {"POV"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:TAB-PLAYTAB|TAB-PROTAB|PROTAB|PlayTabPro|Mobii[ _\-]|TAB-P)[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"POV "} re.group.1 {""};
    set req.http.uap:brand = {"POV"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Prestigio |)((?:PAP|PMP)\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Prestigio "} re.group.1 {""};
    set req.http.uap:brand = {"Prestigio"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PLT[0-9]{4}.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Proscan"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A2|A5|A8|A900)_?(Classic|)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Qmobile"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Q[Mm]obile)_([^_]+)_([^_]+?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Qmobile "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Qmobile"};
    set req.http.uap:model = {""} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Q\-?[Mm]obile)[_ ](A[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Qmobile "} re.group.2 {""};
    set req.http.uap:brand = {"Qmobile"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Q\-Smart)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Qmobilevn"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Q\-?[Mm]obile)[ _\-](S[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Qmobilevn"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TA1013)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Quanta"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (RCT\w+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"RCA"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; RCA (\w+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"RCA "} re.group.1 {""};
    set req.http.uap:brand = {"RCA"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(RK\d+),?(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Rockchip"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ " Build/(RK\d+)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Rockchip"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SAMSUNG |Samsung |)((?:Galaxy (?:Note II|S\d)|GT-I9082|GT-I9205|GT-N7\d{3}|SM-N9005)[^;/]{0,100})\/?[^;/]{0,50} Build/") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Google |)(Nexus [Ss](?: 4G|)) Build/") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SAMSUNG |Samsung )([^\/]{0,50})\/[^ ]{0,50} Build/") {
    set req.http.uap:family = {"Samsung "} re.group.2 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Galaxy(?: Ace| Nexus| S ?II+|Nexus S| with MCR 1.2| Mini Plus 4G|)) Build/") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SAMSUNG[ _\-]|)(?:SAMSUNG[ _\-])([^;/]{1,100}) Build") {
    set req.http.uap:family = {"Samsung "} re.group.2 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SAMSUNG-|)(GT\-[BINPS]\d{4}[^\/]{0,50})(\/[^ ]{0,50}) Build") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(?:; {0,2}|^)((?:GT\-[BIiNPS]\d{4}|I9\d{2}0[A-Za-z\+]?\b)[^;/\)]*?)(?:Build|Linux|MIUI|[;/\)])") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (SAMSUNG-)([A-Za-z0-9\-]{0,50}).{0,200} Build/") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:SCH|SGH|SHV|SHW|SPH|SC|SM)\-[A-Za-z0-9 ]{1,50})(/?[^ ]*|) Build") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:SC)\-[A-Za-z0-9 ]{1,50})(/?[^ ]*|)\)") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ " ((?:SCH)\-[A-Za-z0-9 ]{1,50})(/?[^ ]*|) Build") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Behold ?(?:2|II)|YP\-G[^;/]{1,100}|EK-GC100|SCL21|I9300) Build") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:SCH|SGH|SHV|SHW|SPH|SC|SM)\-[A-Za-z0-9]{5,6})[\)]") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SH\-?\d\d[^;/]{1,100}|SBM\d[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sharp"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SHARP[ -])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Sharp"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SPX[_\-]\d[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Simvalley"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SX7\-PEARL\.GmbH)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Simvalley"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SP[T]?\-\d{2}[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Simvalley"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SK\-.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SKtelesys"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:SKYTEX|SX)-([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Skytex"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(IMAGINE [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Skytex"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SmartQ) ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(WF7C|WF10C|SBT[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Smartbitt"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SBM(?:003SH|005SH|006SH|007SH|102SH)) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sharp"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(003P|101P|101P11C|102P) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Panasonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(00\dZ) Build/") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; HTC(X06HT) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(001HT|X06HT) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(201M) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {"XT902"};
  } else if (req.http.user-agent ~ "; {0,2}(ST\d{4}.{0,200})Build/ST") {
    set req.http.uap:family = {"Trekstor "} re.group.1 {""};
    set req.http.uap:brand = {"Trekstor"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ST\d{4}.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Trekstor "} re.group.1 {""};
    set req.http.uap:brand = {"Trekstor"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Sony ?Ericsson ?)([^;/]{1,100}) Build") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:SK|ST|E|X|LT|MK|MT|WT)\d{2}[a-z0-9]*(?:-o|)|R800i|U20i) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Xperia (?:A8|Arc|Acro|Active|Live with Walkman|Mini|Neo|Play|Pro|Ray|X\d+)[^;/]{0,50}) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; Sony (Tablet[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Sony "} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; Sony ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Sony "} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Sony)([A-Za-z0-9\-]+)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Xperia [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(C(?:1[0-9]|2[0-9]|53|55|6[0-9])[0-9]{2}|D[25]\d{3}|D6[56]\d{2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SGP\d{3}|SGPT\d{2})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(NW-Z1000Series)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "PLAYSTATION 3") {
    set req.http.uap:family = {"PlayStation 3"};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {"PlayStation 3"};
  } else if (req.http.user-agent ~ "(PlayStation (?:Portable|Vita|\d+))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:CSL_Spice|Spice|SPICE|CSL)[ _\-]?|)([Mm][Ii])([ _\-]|)(\d{3}[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""} re.group.4 {""};
    set req.http.uap:brand = {"Spice"};
    set req.http.uap:model = {"Mi"} re.group.4 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Sprint )(.{1,200}?) {0,2}(?:Build|[;/])") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Sprint"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "\b(Sprint)[: ]([^;,/ ]+)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Sprint"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TAGI[ ]?)(MID) ?([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Tagi"};
    set req.http.uap:model = {""} re.group.2 {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Oyster500|Opal 800)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Tecmobile "} re.group.1 {""};
    set req.http.uap:brand = {"Tecmobile"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TECNO[ _])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Tecno"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}Android for (Telechips|Techvision) ([^ ]+) ") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T-Hub2)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Telstra"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PAD) ?(100[12])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Terra "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Terra"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T[BM]-\d{3}[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Texet"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(tolino [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Thalia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}Build/.{0,200} (TOLINO_BROWSER)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Thalia"};
    set req.http.uap:model = {"Tolino Shine"};
  } else if (req.http.user-agent ~ "; {0,2}(?:CJ[ -])?(ThL|THL)[ -]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Thl"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T100|T200|T5|W100|W200|W8s)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Thl"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile[ _]G2[ _]Touch) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"Hero"};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile[ _]G2) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"Desire Z"};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile myTouch Q) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"U8730"};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile myTouch) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"U8680"};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile_Espresso) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"Espresso"};
  } else if (req.http.user-agent ~ "; {0,2}(T-Mobile G1) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {"Dream"};
  } else if (req.http.user-agent ~ "\b(T-Mobile ?|)(myTouch)[ _]?([34]G)[ _]?([^\/]*) (?:Mozilla|Build)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.2 {" "} re.group.3 {" "} re.group.4 {""};
  } else if (req.http.user-agent ~ "\b(T-Mobile)_([^_]+)_(.{0,200}) Build") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Tmobile"};
    set req.http.uap:model = {""} re.group.2 {" "} re.group.3 {""};
  } else if (req.http.user-agent ~ "\b(T-Mobile)[_ ]?(.{0,200}?)Build") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Tmobile"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ " (ATP[0-9]{4})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Tomtec"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ " ?(TOOKY)[ _\-]([^;/]{1,100}) ?(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Tooky"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "\b(TOSHIBA_AC_AND_AZ|TOSHIBA_FOLIO_AND_A|FOLIO_AND_A)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Toshiba"};
    set req.http.uap:model = {"Folio 100"};
  } else if (req.http.user-agent ~ "; {0,2}([Ff]olio ?100)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Toshiba"};
    set req.http.uap:model = {"Folio 100"};
  } else if (req.http.user-agent ~ "; {0,2}(AT[0-9]{2,3}(?:\-A|LE\-A|PE\-A|SE|a|)|AT7-A|AT1S0|Hikari-iFrame/WDPF-[^;/]{1,100}|THRiVE|Thrive)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Toshiba "} re.group.1 {""};
    set req.http.uap:brand = {"Toshiba"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TM-MID\d+[^;/]{1,50}|TOUCHMATE|MID-750)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Touchmate"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TM-SM\d+[^;/]{1,50}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Touchmate"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A10 [Bb]asic2?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Treq"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(TREQ[ _\-])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Treq"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(X-?5|X-?3)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Umeox"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(A502\+?|A936|A603|X1|X2)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Umeox"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; thor Build/") {
    set req.http.uap:family = {"Thor"};
    set req.http.uap:brand = {"Vernee"};
    set req.http.uap:model = {"Thor"};
  } else if (req.http.user-agent ~ "; Thor (E)? Build/") {
    set req.http.uap:family = {"Thor "} re.group.1 {""};
    set req.http.uap:brand = {"Vernee"};
    set req.http.uap:model = {"Thor"};
  } else if (req.http.user-agent ~ "; Apollo Lite Build/") {
    set req.http.uap:family = {"Apollo Lite"};
    set req.http.uap:brand = {"Vernee"};
    set req.http.uap:model = {"Apollo"};
  } else if (req.http.user-agent ~ "(TOUCH(?:TAB|PAD).{1,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Versus "} re.group.1 {""};
    set req.http.uap:brand = {"Versus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(VERTU) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Vertu"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Videocon)[ _\-]([^;/]{1,100}?) {0,2}(?:Build|;)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"Videocon"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ " (VT\d{2}[A-Za-z]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Videocon"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((?:ViewPad|ViewPhone|VSD)[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Viewsonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ViewSonic-)([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"Viewsonic"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(GTablet.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Viewsonic"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([Vv]ivo)[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"vivo"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(Vodafone) (.{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Walton[ _\-]|)(Primo[ _\-][^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Walton "} re.group.1 {""};
    set req.http.uap:brand = {"Walton"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:WIKO[ \-]|)(CINK\+?|BARRY|BLOOM|DARKFULL|DARKMOON|DARKNIGHT|DARKSIDE|FIZZ|HIGHWAY|IGGY|OZZY|RAINBOW|STAIRWAY|SUBLIM|WAX|CINK [^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Wiko "} re.group.1 {""};
    set req.http.uap:brand = {"Wiko"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}WellcoM-([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Wellcom "} re.group.1 {""};
    set req.http.uap:brand = {"Wellcom"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:(WeTab)-Browser|; (wetab) Build)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"WeTab"};
    set req.http.uap:model = {"WeTab"};
  } else if (req.http.user-agent ~ "; {0,2}(AT-AS[^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Wolfgang "} re.group.1 {""};
    set req.http.uap:brand = {"Wolfgang"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Woxter|Wxt) ([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Woxter "} re.group.1 {""};
    set req.http.uap:brand = {"Woxter"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Xenta |Luna |)(TAB[234][0-9]{2}|TAB0[78]-\d{3}|TAB0?9-\d{3}|TAB1[03]-\d{3}|SMP\d{2}-\d{3})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Yarvik "} re.group.1 {""};
    set req.http.uap:brand = {"Yarvik"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([A-Z]{2,4})(M\d{3,}[A-Z]{2})([^;\)\/]*)(?: Build|[;\)])") {
    set req.http.uap:family = {"Yifang "} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Yifang"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}((Mi|MI|HM|MI-ONE|Redmi)[ -](NOTE |Note |)[^;/]*) (Build|MIUI)/") {
    set req.http.uap:family = {"XiaoMi "} re.group.1 {""};
    set req.http.uap:brand = {"XiaoMi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((Mi|MI|HM|MI-ONE|Redmi)[ -](NOTE |Note |)[^;/\)]*)") {
    set req.http.uap:family = {"XiaoMi "} re.group.1 {""};
    set req.http.uap:brand = {"XiaoMi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(MIX) (Build|MIUI)/") {
    set req.http.uap:family = {"XiaoMi "} re.group.1 {""};
    set req.http.uap:brand = {"XiaoMi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}((MIX) ([^;/]*)) (Build|MIUI)/") {
    set req.http.uap:family = {"XiaoMi "} re.group.1 {""};
    set req.http.uap:brand = {"XiaoMi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}XOLO[ _]([^;/]{0,30}tab.{0,30})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Xolo "} re.group.1 {""};
    set req.http.uap:brand = {"Xolo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}XOLO[ _]([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Xolo "} re.group.1 {""};
    set req.http.uap:brand = {"Xolo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(q\d0{2,3}[a-z]?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Xolo "} re.group.1 {""};
    set req.http.uap:brand = {"Xolo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(PAD ?[79]\d+[^;/]{0,50}|TelePAD\d+[^;/])(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Xoro "} re.group.1 {""};
    set req.http.uap:brand = {"Xoro"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:(?:ZOPO|Zopo)[ _]([^;/]{1,100}?)|(ZP ?(?:\d{2}[^;/]{1,100}|C2))|(C[2379]))(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Zopo"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ZiiLABS) (Zii[^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"ZiiLabs"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Zii)_([^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"ZiiLabs"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(ARIZONA|(?:ATLAS|Atlas) W|D930|Grand (?:[SX][^;]{0,200}?|Era|Memo[^;]{0,200}?)|JOE|(?:Kis|KIS)\b[^;]{0,200}?|Libra|Light [^;]{0,200}?|N8[056][01]|N850L|N8000|N9[15]\d{2}|N9810|NX501|Optik|(?:Vip )Racer[^;]{0,200}?|RacerII|RACERII|San Francisco[^;]{0,200}?|V9[AC]|V55|V881|Z[679][0-9]{2}[A-z]?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}([A-Z]\d+)_USA_[^;]{0,200}(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(SmartTab\d+)[^;]{0,50}(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Blade|BLADE|ZTE-BLADE)([^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"ZTE Blade"} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {"Blade"} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:Skate|SKATE|ZTE-SKATE)([^;/]*)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"ZTE Skate"} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {"Skate"} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(Orange |Optimus )(Monte Carlo|San Francisco)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(?:ZXY-ZTE_|ZTE\-U |ZTE[\- _]|ZTE-C[_ ])([^;/]{1,100}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"ZTE "} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (BASE) (lutea|Lutea 2|Tab[^;]{0,200}?)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "; (Avea inTouch 2|soft stone|tmn smart a7|Movistar[ _]Link)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(vp9plus)\)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; ?(Cloud[ _]Z5|z1000|Z99 2G|z99|z930|z999|z990|z909|Z919|z900)(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Zync"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; ?(KFOT|Kindle Fire) Build\b") {
    set req.http.uap:family = {"Kindle Fire"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire"};
  } else if (req.http.user-agent ~ "; ?(KFOTE|Amazon Kindle Fire2) Build\b") {
    set req.http.uap:family = {"Kindle Fire 2"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire 2"};
  } else if (req.http.user-agent ~ "; ?(KFTT) Build\b") {
    set req.http.uap:family = {"Kindle Fire HD"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HD 7""};
  } else if (req.http.user-agent ~ "; ?(KFJWI) Build\b") {
    set req.http.uap:family = {"Kindle Fire HD 8.9" WiFi"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HD 8.9" WiFi"};
  } else if (req.http.user-agent ~ "; ?(KFJWA) Build\b") {
    set req.http.uap:family = {"Kindle Fire HD 8.9" 4G"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HD 8.9" 4G"};
  } else if (req.http.user-agent ~ "; ?(KFSOWI) Build\b") {
    set req.http.uap:family = {"Kindle Fire HD 7" WiFi"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HD 7" WiFi"};
  } else if (req.http.user-agent ~ "; ?(KFTHWI) Build\b") {
    set req.http.uap:family = {"Kindle Fire HDX 7" WiFi"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HDX 7" WiFi"};
  } else if (req.http.user-agent ~ "; ?(KFTHWA) Build\b") {
    set req.http.uap:family = {"Kindle Fire HDX 7" 4G"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HDX 7" 4G"};
  } else if (req.http.user-agent ~ "; ?(KFAPWI) Build\b") {
    set req.http.uap:family = {"Kindle Fire HDX 8.9" WiFi"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HDX 8.9" WiFi"};
  } else if (req.http.user-agent ~ "; ?(KFAPWA) Build\b") {
    set req.http.uap:family = {"Kindle Fire HDX 8.9" 4G"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire HDX 8.9" 4G"};
  } else if (req.http.user-agent ~ "; ?Amazon ([^;/]{1,100}) Build\b") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; ?(Kindle) Build\b") {
    set req.http.uap:family = {"Kindle"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle"};
  } else if (req.http.user-agent ~ "; ?(Silk)/(\d+)\.(\d+)(?:\.([0-9\-]+)|) Build\b") {
    set req.http.uap:family = {"Kindle Fire"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle Fire"} re.group.2 {""};
  } else if (req.http.user-agent ~ " (Kindle)/(\d+\.\d+)") {
    set req.http.uap:family = {"Kindle"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ " (Silk|Kindle)/(\d+)\.") {
    set req.http.uap:family = {"Kindle"};
    set req.http.uap:brand = {"Amazon"};
    set req.http.uap:model = {"Kindle"};
  } else if (req.http.user-agent ~ "(sprd)\-([^/]{1,50})/") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "; {0,2}(H\d{2}00\+?) Build") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Hero"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(iphone|iPhone5) Build/") {
    set req.http.uap:family = {"Xianghe "} re.group.1 {""};
    set req.http.uap:brand = {"Xianghe"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(e\d{4}[a-z]?_?v\d+|v89_[^;/]{1,100})[^;/]{1,30} Build/") {
    set req.http.uap:family = {"Xianghe "} re.group.1 {""};
    set req.http.uap:brand = {"Xianghe"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\bUSCC[_\-]?([^ ;/\)]+)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Cellular"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:ALCATEL)[^;]{0,200}; {0,2}([^;,\)]+)") {
    set req.http.uap:family = {"Alcatel "} re.group.1 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|WpsLondonTest; ?|)(?:ASUS|Asus)[^;]{0,200}; {0,2}([^;,\)]+)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:DELL|Dell)[^;]{0,200}; {0,2}([^;,\)]+)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|WpsLondonTest; ?|)(?:HTC|Htc|HTC_blocked[^;]{0,200})[^;]{0,200}; {0,2}(?:HTC|)([^;,\)]+)") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:HUAWEI)[^;]{0,200}; {0,2}(?:HUAWEI |)([^;,\)]+)") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:LG|Lg)[^;]{0,200}; {0,2}(?:LG[ \-]|)([^;,\)]+)") {
    set req.http.uap:family = {"LG "} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:rv:11; |)(?:NOKIA|Nokia)[^;]{0,200}; {0,2}(?:NOKIA ?|Nokia ?|LUMIA ?|[Ll]umia ?|)(\d{3,10}[^;\)]*)") {
    set req.http.uap:family = {"Lumia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {"Lumia "} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:NOKIA|Nokia)[^;]{0,200}; {0,2}(RM-\d{3,})") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)]|WPDesktop;) ?(?:ARM; ?Touch; ?|Touch; ?|)(?:NOKIA|Nokia)[^;]{0,200}; {0,2}(?:NOKIA ?|Nokia ?|LUMIA ?|[Ll]umia ?|)([^;\)]+)") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|)(?:Microsoft(?: Corporation|))[^;]{0,200}; {0,2}([^;,\)]+)") {
    set req.http.uap:family = {"Microsoft "} re.group.1 {""};
    set req.http.uap:brand = {"Microsoft"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|WpsLondonTest; ?|)(?:SAMSUNG)[^;]{0,200}; {0,2}(?:SAMSUNG |)([^;,\.\)]+)") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|WpsLondonTest; ?|)(?:TOSHIBA|FujitsuToshibaMobileCommun)[^;]{0,200}; {0,2}([^;,\)]+)") {
    set req.http.uap:family = {"Toshiba "} re.group.1 {""};
    set req.http.uap:brand = {"Toshiba"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Windows Phone [^;]{1,30}; .{0,100}?IEMobile/[^;\)]+[;\)] ?(?:ARM; ?Touch; ?|Touch; ?|WpsLondonTest; ?|)([^;]{1,200}); {0,2}([^;,\)]+)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(?:^|; )SAMSUNG\-([A-Za-z0-9\-]{1,50}).{0,200} Bada/") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\(Mobile; ALCATEL ?(One|ONE) ?(Touch|TOUCH) ?([^;/]{1,100}?)(?:/[^;]{1,200}|); rv:[^\)]{1,200}\) Gecko/[^\/]{1,200} Firefox/") {
    set req.http.uap:family = {"Alcatel "} re.group.1 {" "} re.group.2 {" "} re.group.3 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {"One Touch "} re.group.3 {""};
  } else if (req.http.user-agent ~ "\(Mobile; (?:ZTE([^;]{1,200})|(OpenC)); rv:[^\)]{1,200}\) Gecko/[^\/]{1,200} Firefox/") {
    set req.http.uap:family = {"ZTE "} re.group.1 {""} re.group.2 {""};
    set req.http.uap:brand = {"ZTE"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "\(Mobile; ALCATEL([A-Za-z0-9\-]+); rv:[^\)]{1,200}\) Gecko/[^\/]{1,200} Firefox/[^\/]{1,200} KaiOS/") {
    set req.http.uap:family = {"Alcatel "} re.group.1 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\(Mobile; LYF\/([A-Za-z0-9\-]{1,100})\/.{0,100};.{0,100}rv:[^\)]{1,100}\) Gecko/[^\/]{1,100} Firefox/[^\/]{1,100} KAIOS/") {
    set req.http.uap:family = {"LYF "} re.group.1 {""};
    set req.http.uap:brand = {"LYF"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\(Mobile; Nokia_([A-Za-z0-9\-]{1,100})_.{1,100}; rv:[^\)]{1,100}\) Gecko/[^\/]{1,100} Firefox/[^\/]{1,100} KAIOS/") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Nokia(N[0-9]+)([A-Za-z_\-][A-Za-z0-9_\-]*)") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(?:NOKIA|Nokia)(?:\-| {0,2})(?:([A-Za-z0-9]+)\-[0-9a-f]{32}|([A-Za-z0-9\-]+)(?:UCBrowser)|([A-Za-z0-9\-]+))") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "Lumia ([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Lumia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {"Lumia "} re.group.1 {""};
  } else if (req.http.user-agent ~ "\(Symbian; U; S60 V5; [A-z]{2}\-[A-z]{2}; (SonyEricsson|Samsung|Nokia|LG)([^;/]{1,100}?)\)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "\(Symbian(?:/3|); U; ([^;]{1,200});") {
    set req.http.uap:family = {"Nokia "} re.group.1 {""};
    set req.http.uap:brand = {"Nokia"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "BB10; ([A-Za-z0-9\- ]+)\)") {
    set req.http.uap:family = {"BlackBerry "} re.group.1 {""};
    set req.http.uap:brand = {"BlackBerry"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Play[Bb]ook.{1,200}RIM Tablet OS") {
    set req.http.uap:family = {"BlackBerry Playbook"};
    set req.http.uap:brand = {"BlackBerry"};
    set req.http.uap:model = {"Playbook"};
  } else if (req.http.user-agent ~ "Black[Bb]erry ([0-9]+);") {
    set req.http.uap:family = {"BlackBerry "} re.group.1 {""};
    set req.http.uap:brand = {"BlackBerry"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Black[Bb]erry([0-9]+)") {
    set req.http.uap:family = {"BlackBerry "} re.group.1 {""};
    set req.http.uap:brand = {"BlackBerry"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Black[Bb]erry;") {
    set req.http.uap:family = {"BlackBerry"};
    set req.http.uap:brand = {"BlackBerry"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "(Pre|Pixi)/\d+\.\d+") {
    set req.http.uap:family = {"Palm "} re.group.1 {""};
    set req.http.uap:brand = {"Palm"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Palm([0-9]+)") {
    set req.http.uap:family = {"Palm "} re.group.1 {""};
    set req.http.uap:brand = {"Palm"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Treo([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Palm Treo "} re.group.1 {""};
    set req.http.uap:brand = {"Palm"};
    set req.http.uap:model = {"Treo "} re.group.1 {""};
  } else if (req.http.user-agent ~ "webOS.{0,200}(P160U(?:NA|))/(\d+).(\d+)") {
    set req.http.uap:family = {"HP Veer"};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {"Veer"};
  } else if (req.http.user-agent ~ "(Touch[Pp]ad)/\d+\.\d+") {
    set req.http.uap:family = {"HP TouchPad"};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {"TouchPad"};
  } else if (req.http.user-agent ~ "HPiPAQ([A-Za-z0-9]{1,20})/\d+\.\d+") {
    set req.http.uap:family = {"HP iPAQ "} re.group.1 {""};
    set req.http.uap:brand = {"HP"};
    set req.http.uap:model = {"iPAQ "} re.group.1 {""};
  } else if (req.http.user-agent ~ "PDA; (PalmOS)/sony/model ([a-z]+)/Revision") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Sony"};
    set req.http.uap:model = {""} re.group.1 {" "} re.group.2 {""};
  } else if (req.http.user-agent ~ "(Apple\s?TV)") {
    set req.http.uap:family = {"AppleTV"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"AppleTV"};
  } else if (req.http.user-agent ~ "(QtCarBrowser)") {
    set req.http.uap:family = {"Tesla Model S"};
    set req.http.uap:brand = {"Tesla"};
    set req.http.uap:model = {"Model S"};
  } else if (req.http.user-agent ~ "(iPhone|iPad|iPod)(\d+,\d+)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(iPad)(?:;| Simulator;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(iPod)(?:;| touch;| Simulator;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(iPhone)(?:;| Simulator;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(Watch)(\d+,\d+)") {
    set req.http.uap:family = {"Apple "} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "(Apple Watch)(?:;| Simulator;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(HomePod)(?:;| Simulator;)") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "iPhone") {
    set req.http.uap:family = {"iPhone"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"iPhone"};
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/\d.{0,100}\(((?:Mac|iMac|PowerMac|PowerBook)[^\d]*)(\d+)(?:,|\x252C)(\d+)") {
    set req.http.uap:family = {""} re.group.1 {""} re.group.2 {","} re.group.3 {""};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {""} re.group.1 {""} re.group.2 {","} re.group.3 {""};
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/\d+\.\d+\.\d+ \(x86_64\)") {
    set req.http.uap:family = {"Mac"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"Mac"};
  } else if (req.http.user-agent ~ "CFNetwork/.{0,100} Darwin/\d") {
    set req.http.uap:family = {"iOS-Device"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"iOS-Device"};
  } else if (req.http.user-agent ~ "Outlook-(iOS)/\d+\.\d+\.prod\.iphone") {
    set req.http.uap:family = {"iPhone"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"iPhone"};
  } else if (req.http.user-agent ~ "acer_([A-Za-z0-9]+)_") {
    set req.http.uap:family = {"Acer "} re.group.1 {""};
    set req.http.uap:brand = {"Acer"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:ALCATEL|Alcatel)-([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Alcatel "} re.group.1 {""};
    set req.http.uap:brand = {"Alcatel"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:Amoi|AMOI)\-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Amoi "} re.group.1 {""};
    set req.http.uap:brand = {"Amoi"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:; |\/|^)((?:Transformer (?:Pad|Prime) |Transformer |PadFone[ _]?)[A-Za-z0-9]*)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:asus.{0,200}?ASUS|Asus|ASUS|asus)[\- ;]*((?:Transformer (?:Pad|Prime) |Transformer |Padfone |Nexus[ _]|)[A-Za-z0-9]+)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:ASUS)_([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Asus "} re.group.1 {""};
    set req.http.uap:brand = {"Asus"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\bBIRD[ \-\.]([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Bird "} re.group.1 {""};
    set req.http.uap:brand = {"Bird"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\bDell ([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Dell "} re.group.1 {""};
    set req.http.uap:brand = {"Dell"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "DoCoMo/2\.0 ([A-Za-z0-9]+)") {
    set req.http.uap:family = {"DoCoMo "} re.group.1 {""};
    set req.http.uap:brand = {"DoCoMo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^.{0,50}?([A-Za-z0-9]{1,30})_W;FOMA") {
    set req.http.uap:family = {"DoCoMo "} re.group.1 {""};
    set req.http.uap:brand = {"DoCoMo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^.{0,50}?([A-Za-z0-9]{1,30});FOMA") {
    set req.http.uap:family = {"DoCoMo "} re.group.1 {""};
    set req.http.uap:brand = {"DoCoMo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "\b(?:HTC/|HTC/[a-z0-9]{1,20}/|)HTC[ _\-;]? {0,2}(.{0,200}?)(?:-?Mozilla|fingerPrint|[;/\(\)]|$)") {
    set req.http.uap:family = {"HTC "} re.group.1 {""};
    set req.http.uap:brand = {"HTC"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Huawei([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "HUAWEI-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "HUAWEI ([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Huawei "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "vodafone([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Huawei Vodafone "} re.group.1 {""};
    set req.http.uap:brand = {"Huawei"};
    set req.http.uap:model = {"Vodafone "} re.group.1 {""};
  } else if (req.http.user-agent ~ "i\-mate ([A-Za-z0-9]+)") {
    set req.http.uap:family = {"i-mate "} re.group.1 {""};
    set req.http.uap:brand = {"i-mate"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Kyocera\-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Kyocera "} re.group.1 {""};
    set req.http.uap:brand = {"Kyocera"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "KWC\-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Kyocera "} re.group.1 {""};
    set req.http.uap:brand = {"Kyocera"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Lenovo[_\-]([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Lenovo "} re.group.1 {""};
    set req.http.uap:brand = {"Lenovo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(HbbTV)/[0-9]+\.[0-9]+\.[0-9]+ \( ?;(LG)E ?;([^;]{0,30})") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {""} re.group.2 {""};
    set req.http.uap:model = {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "(HbbTV)/1\.1\.1.{0,200}CE-HTML/1\.\d;(Vendor/|)(THOM[^;]{0,200}?)[;\s].{0,30}(LF[^;]{1,200});?") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Thomson"};
    set req.http.uap:model = {""} re.group.4 {""};
  } else if (req.http.user-agent ~ "(HbbTV)(?:/1\.1\.1|) ?(?: \(;;;;;\)|); {0,2}CE-HTML(?:/1\.\d|); {0,2}([^ ]{1,30}) ([^;]{1,200});") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {""} re.group.2 {""};
    set req.http.uap:model = {""} re.group.3 {""};
  } else if (req.http.user-agent ~ "(HbbTV)/1\.1\.1 \(;;;;;\) Maple_2011") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "(HbbTV)/[0-9]+\.[0-9]+\.[0-9]+ \([^;]{0,30}; ?(?:CUS:([^;]{0,200})|([^;]{1,200})) ?; ?([^;]{0,30})") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {""} re.group.2 {""} re.group.3 {""};
    set req.http.uap:model = {""} re.group.4 {""};
  } else if (req.http.user-agent ~ "(HbbTV)/[0-9]+\.[0-9]+\.[0-9]+") {
    set req.http.uap:family = {""} re.group.1 {""};

    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "LGE; (?:Media\/|)([^;]{0,200});[^;]{0,200};[^;]{0,200};?\); \x22?LG NetCast(\.TV|\.Media|)-\d+") {
    set req.http.uap:family = {"NetCast"} re.group.2 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "InettvBrowser/[0-9]{1,30}\.[0-9A-Z]{1,30} \([^;]{0,200};(Sony)([^;]{0,200});[^;]{0,200};[^\)]{0,10}\)") {
    set req.http.uap:family = {"Inettv"};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "InettvBrowser/[0-9]{1,30}\.[0-9A-Z]{1,30} \([^;]{0,200};([^;]{0,200});[^;]{0,200};[^\)]{0,10}\)") {
    set req.http.uap:family = {"Inettv"};
    set req.http.uap:brand = {"Generic_Inettv"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:InettvBrowser|TSBNetTV|NETTV|HBBTV)") {
    set req.http.uap:family = {"Inettv"};
    set req.http.uap:brand = {"Generic_Inettv"};
    set req.http.uap:model = re.group.1;
  } else if (req.http.user-agent ~ "Series60/\d\.\d (LG)[\-]?([A-Za-z0-9 \-]+)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "\b(?:LGE[ \-]LG\-(?:AX|)|LGE |LGE?-LG|LGE?[ \-]|LG[ /\-]|lg[\-])([A-Za-z0-9]+)\b") {
    set req.http.uap:family = {"LG "} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:^LG[\-]?|^LGE[\-/]?)([A-Za-z]+[0-9]+[A-Za-z]*)") {
    set req.http.uap:family = {"LG "} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^LG([0-9]+[A-Za-z]*)") {
    set req.http.uap:family = {"LG "} re.group.1 {""};
    set req.http.uap:brand = {"LG"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(KIN\.[^ ]+) (\d+)\.(\d+)") {
    set req.http.uap:family = {"Microsoft "} re.group.1 {""};
    set req.http.uap:brand = {"Microsoft"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:MSIE|XBMC).{0,200}\b(Xbox)\b") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Microsoft"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; ARM; Trident/6\.0; Touch[\);]") {
    set req.http.uap:family = {"Microsoft Surface RT"};
    set req.http.uap:brand = {"Microsoft"};
    set req.http.uap:model = {"Surface RT"};
  } else if (req.http.user-agent ~ "Motorola\-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "MOTO\-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "MOT\-([A-z0-9][A-z0-9\-]*)") {
    set req.http.uap:family = {"Motorola "} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; (moto[ a-zA-z0-9()]{0,50});((?: Build|.{0,50}\) AppleWebKit))") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "; {0,2}(moto)(.{0,50})(?: Build|\) AppleWebKit)") {
    set req.http.uap:family = {"Motorola"} re.group.2 {""};
    set req.http.uap:brand = {"Motorola"};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "Nintendo WiiU") {
    set req.http.uap:family = {"Nintendo Wii U"};
    set req.http.uap:brand = {"Nintendo"};
    set req.http.uap:model = {"Wii U"};
  } else if (req.http.user-agent ~ "Nintendo (Switch|DS|3DS|DSi|Wii);") {
    set req.http.uap:family = {"Nintendo "} re.group.1 {""};
    set req.http.uap:brand = {"Nintendo"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(?:Pantech|PANTECH)[ _-]?([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Pantech "} re.group.1 {""};
    set req.http.uap:brand = {"Pantech"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Philips([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Philips "} re.group.1 {""};
    set req.http.uap:brand = {"Philips"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Philips ([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Philips "} re.group.1 {""};
    set req.http.uap:brand = {"Philips"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(SMART-TV); .{0,200} Tizen ") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "SymbianOS/9\.\d.{0,200} Samsung[/\-]([A-Za-z0-9 \-]+)") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(Samsung)(SGH)(i[0-9]+)") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""} re.group.3 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {"-"} re.group.3 {""};
  } else if (req.http.user-agent ~ "SAMSUNG-ANDROID-MMS/([^;/]{1,100})") {
    set req.http.uap:family = {""} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "SAMSUNG(?:; |[ -/])([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Samsung "} re.group.1 {""};
    set req.http.uap:brand = {"Samsung"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(Dreamcast)") {
    set req.http.uap:family = {"Sega "} re.group.1 {""};
    set req.http.uap:brand = {"Sega"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^SIE-([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Siemens "} re.group.1 {""};
    set req.http.uap:brand = {"Siemens"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Softbank/[12]\.0/([A-Za-z0-9]+)") {
    set req.http.uap:family = {"Softbank "} re.group.1 {""};
    set req.http.uap:brand = {"Softbank"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "SonyEricsson ?([A-Za-z0-9\-]+)") {
    set req.http.uap:family = {"Ericsson "} re.group.1 {""};
    set req.http.uap:brand = {"SonyEricsson"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android [^;]{1,200}; ([^ ]+) (Sony)/") {
    set req.http.uap:family = {""} re.group.2 {" "} re.group.1 {""};
    set req.http.uap:brand = {""} re.group.2 {""};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(Sony)(?:BDP\/|\/|)([^ /;\)]+)[ /;\)]") {
    set req.http.uap:family = {""} re.group.1 {" "} re.group.2 {""};
    set req.http.uap:brand = {""} re.group.1 {""};
    set req.http.uap:model = {""} re.group.2 {""};
  } else if (req.http.user-agent ~ "Puffin/[\d\.]+IT") {
    set req.http.uap:family = {"iPad"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"iPad"};
  } else if (req.http.user-agent ~ "Puffin/[\d\.]+IP") {
    set req.http.uap:family = {"iPhone"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"iPhone"};
  } else if (req.http.user-agent ~ "Puffin/[\d\.]+AT") {
    set req.http.uap:family = {"Generic Tablet"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Tablet"};
  } else if (req.http.user-agent ~ "Puffin/[\d\.]+AP") {
    set req.http.uap:family = {"Generic Smartphone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+\.[\d]+; [A-Za-z]{2}\-[A-Za-z]{0,2}; WOWMobile (.{1,200})( Build[/ ]|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+\.[\d]+\-update1; [A-Za-z]{2}\-[A-Za-z]{0,2} {0,2}; {0,2}(.{1,200}?)( Build[/ ]|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+(?:\.[\d]+)(?:\.[\d]+|); {0,2}[A-Za-z]{2}[_\-][A-Za-z]{0,2}\-? {0,2}; {0,2}(.{1,200}?)( Build[/ ]|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+(?:\.[\d]+)(?:\.[\d]+|); {0,2}[A-Za-z]{0,2}\- {0,2}; {0,2}(.{1,200}?)( Build[/ ]|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+(?:\.[\d]+)(?:\.[\d]+|); {0,2}[a-z]{0,2}[_\-]?[A-Za-z]{0,2};?( Build[/ ]|\))") {
    set req.http.uap:family = {"Generic Smartphone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "Android[\- ][\d]+(?:\.[\d]+)(?:\.[\d]+|); {0,3}\-?[A-Za-z]{2}; {0,2}(.{1,50}?)( Build[/ ]|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android \d+?(?:\.\d+|)(?:\.\d+|); ([^;]{1,100}?)(?: Build|\) AppleWebKit).{1,200}? Mobile Safari") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android \d+?(?:\.\d+|)(?:\.\d+|); ([^;]{1,100}?)(?: Build|\) AppleWebKit).{1,200}? Safari") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android_Tablet"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "Android \d+?(?:\.\d+|)(?:\.\d+|); ([^;]{1,100}?)(?: Build|\))") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Android"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(GoogleTV)") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Inettv"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(WebTV)/\d+.\d+") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Inettv"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "^(Roku)/DVP-\d+\.\d+") {
    set req.http.uap:family = re.group.1;
    set req.http.uap:brand = {"Generic_Inettv"};
    set req.http.uap:model = {""} re.group.1 {""};
  } else if (req.http.user-agent ~ "(Android 3\.\d|Opera Tablet|Tablet; .{1,100}Firefox/|Android.{0,100}(?:Tab|Pad))") {
    set req.http.uap:family = {"Generic Tablet"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Tablet"};
  } else if (req.http.user-agent ~ "(Symbian|\bS60(Version|V\d)|\bS60\b|\((Series 60|Windows Mobile|Palm OS|Bada); Opera Mini|Windows CE|Opera Mobi|BREW|Brew|Mobile; .{1,200}Firefox/|iPhone OS|Android|MobileSafari|Windows {0,2}Phone|\(webOS/|PalmOS)") {
    set req.http.uap:family = {"Generic Smartphone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "(hiptop|avantgo|plucker|xiino|blazer|elaine)") {
    set req.http.uap:family = {"Generic Smartphone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Smartphone"};
  } else if (req.http.user-agent ~ "^.{0,100}(bot|BUbiNG|zao|borg|DBot|oegp|silk|Xenu|zeal|^NING|CCBot|crawl|htdig|lycos|slurp|teoma|voila|yahoo|Sogou|CiBra|Nutch|^Java/|^JNLP/|Daumoa|Daum|Genieo|ichiro|larbin|pompos|Scrapy|snappy|speedy|spider|msnbot|msrbot|vortex|^vortex|crawler|favicon|indexer|Riddler|scooter|scraper|scrubby|WhatWeb|WinHTTP|bingbot|BingPreview|openbot|gigabot|furlbot|polybot|seekbot|^voyager|archiver|Icarus6j|mogimogi|Netvibes|blitzbot|altavista|charlotte|findlinks|Retreiver|TLSProber|WordPress|SeznamBot|ProoXiBot|wsr\-agent|Squrl Java|EtaoSpider|PaperLiBot|SputnikBot|A6\-Indexer|netresearch|searchsight|baiduspider|YisouSpider|ICC\-Crawler|http\x2520client|Python-urllib|dataparksearch|converacrawler|Screaming Frog|AppEngine-Google|YahooCacheSystem|fast\-webcrawler|Sogou Pic Spider|semanticdiscovery|Innovazion Crawler|facebookexternalhit|Google.{0,200}/\+/web/snippet|Google-HTTP-Java-Client|BlogBridge|IlTrovatore-Setaccio|InternetArchive|GomezAgent|WebThumbnail|heritrix|NewsGator|PagePeeker|Reaper|ZooShot|holmes|NL-Crawler|Pingdom|StatusCake|WhatsApp|masscan|Google Web Preview|Qwantify|Yeti|OgScrper|RecipeRadar|GPTBot|Google-InspectionTool)") {
    set req.http.uap:family = {"Spider"};
    set req.http.uap:brand = {"Spider"};
    set req.http.uap:model = {"Desktop"};
  } else if (req.http.user-agent ~ "^(1207|3gso|4thp|501i|502i|503i|504i|505i|506i|6310|6590|770s|802s|a wa|acer|acs\-|airn|alav|asus|attw|au\-m|aur |aus |abac|acoo|aiko|alco|alca|amoi|anex|anny|anyw|aptu|arch|argo|bmobile|bell|bird|bw\-n|bw\-u|beck|benq|bilb|blac|c55/|cdm\-|chtm|capi|comp|cond|dall|dbte|dc\-s|dica|ds\-d|ds12|dait|devi|dmob|doco|dopo|dorado|el(?:38|39|48|49|50|55|58|68)|el[3456]\d{2}dual|erk0|esl8|ex300|ez40|ez60|ez70|ezos|ezze|elai|emul|eric|ezwa|fake|fly\-|fly_|g\-mo|g1 u|g560|gf\-5|grun|gene|go.w|good|grad|hcit|hd\-m|hd\-p|hd\-t|hei\-|hp i|hpip|hs\-c|htc |htc\-|htca|htcg)") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "^(htcp|htcs|htct|htc_|haie|hita|huaw|hutc|i\-20|i\-go|i\-ma|i\-mobile|i230|iac|iac\-|iac/|ig01|im1k|inno|iris|jata|kddi|kgt|kgt/|kpt |kwc\-|klon|lexi|lg g|lg\-a|lg\-b|lg\-c|lg\-d|lg\-f|lg\-g|lg\-k|lg\-l|lg\-m|lg\-o|lg\-p|lg\-s|lg\-t|lg\-u|lg\-w|lg/k|lg/l|lg/u|lg50|lg54|lge\-|lge/|leno|m1\-w|m3ga|m50/|maui|mc01|mc21|mcca|medi|meri|mio8|mioa|mo01|mo02|mode|modo|mot |mot\-|mt50|mtp1|mtv |mate|maxo|merc|mits|mobi|motv|mozz|n100|n101|n102|n202|n203|n300|n302|n500|n502|n505|n700|n701|n710|nec\-|nem\-|newg|neon)") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "^(netf|noki|nzph|o2 x|o2\-x|opwv|owg1|opti|oran|ot\-s|p800|pand|pg\-1|pg\-2|pg\-3|pg\-6|pg\-8|pg\-c|pg13|phil|pn\-2|pt\-g|palm|pana|pire|pock|pose|psio|qa\-a|qc\-2|qc\-3|qc\-5|qc\-7|qc07|qc12|qc21|qc32|qc60|qci\-|qwap|qtek|r380|r600|raks|rim9|rove|s55/|sage|sams|sc01|sch\-|scp\-|sdk/|se47|sec\-|sec0|sec1|semc|sgh\-|shar|sie\-|sk\-0|sl45|slid|smb3|smt5|sp01|sph\-|spv |spv\-|sy01|samm|sany|sava|scoo|send|siem|smar|smit|soft|sony|t\-mo|t218|t250|t600|t610|t618|tcl\-|tdg\-|telm|tim\-|ts70|tsm\-|tsm3|tsm5|tx\-9|tagt)") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "^(talk|teli|topl|tosh|up.b|upg1|utst|v400|v750|veri|vk\-v|vk40|vk50|vk52|vk53|vm40|vx98|virg|vertu|vite|voda|vulc|w3c |w3c\-|wapj|wapp|wapu|wapm|wig |wapi|wapr|wapv|wapy|wapa|waps|wapt|winc|winw|wonu|x700|xda2|xdag|yas\-|your|zte\-|zeto|aste|audi|avan|blaz|brew|brvw|bumb|ccwa|cell|cldc|cmd\-|dang|eml2|fetc|hipt|http|ibro|idea|ikom|ipaq|jbro|jemu|jigs|keji|kyoc|kyok|libw|m\-cr|midp|mmef|moto|mwbp|mywa|newt|nok6|o2im|pant|pdxg|play|pluc|port|prox|rozo|sama|seri|smal|symb|treo|upsi|vx52|vx53|vx60|vx61|vx70|vx80|vx81|vx83|vx85|wap\-|webc|whit|wmlb|xda\-|xda_)") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "^(Ice)$") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "(wap[\-\ ]browser|maui|netfront|obigo|teleca|up\.browser|midp|Opera Mini)") {
    set req.http.uap:family = {"Generic Feature Phone"};
    set req.http.uap:brand = {"Generic"};
    set req.http.uap:model = {"Feature Phone"};
  } else if (req.http.user-agent ~ "Mac OS") {
    set req.http.uap:family = {"Mac"};
    set req.http.uap:brand = {"Apple"};
    set req.http.uap:model = {"Mac"};
  } else {
  }

  set var.result = req.http.uap;
  unset req.http.uap;

  return var.result;
}
