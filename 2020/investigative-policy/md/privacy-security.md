# Privacy, security and some basic e-sleuthing

### Protect yourself, and your sources

Your emails, phone calls, web surfing and searches are not guaranteed to be private. Neither are files on your computer. But there are important steps you can take to protect your information from most attempts to access it.

As a private citizen, the extent to which you wish to take advantage of these protections is your choice. However, as a journalist you may need to protect the identity of confidential sources, and information supplied by them. Poor security practices on your part puts them at risk. So it is important that journalists should follow good practice in digital security. They should also know how to encrypt their information and, when necessary, their communication.

### Don't get phished!

People are the weak points in many organization's digital security, because they can be tricked into doing things that are insecure. That's why so many hackers launch "phishing" attacks, which are intended either to get people to enter their username and password into a fake login screen, or to download files infected with malware. Email is the most popular method, because sender addresses are so easy to fake, or [spoof](https://en.wikipedia.org/wiki/Email_spoofing). But such attacks can come by other communication methods.

Phising can be disastrous for newsrooms, as in 2013, when the [AP's Twitter account was hijacked](https://www.bloomberg.com/news/articles/2013-04-23/dow-jones-drops-recovers-after-false-report-on-ap-twitter-page) in phishing scam, and used to post a false message about an attack on the White House.

So don't be the person that compromises your news organization's digital security! Responsible websites should never ask you for your login details, so don't follow a link and type them into a web form. Also be very careful about downloading and opening attachments -- even Word documents can contain embedded scripts that can hijack your computer, and remember that an email that seems to have comes from a colleague's address may be from someone else.

### Passwords and passphrases

Most people are terrible at setting passwords, using common words or easily-guessed numbers. But even if you don't use `password` or `123456` you aren't safe. Password-guessing software can try millions of combinations per second (probably trillions, in the case of the NSA). So even "strong" passwords, employing hard-to-remember combinations of letters, numbers and special characters, are relatively easy to crack.

Make sure to use a different password for each service you use, so that a breach of one doesn't compromise other accounts. That creates a problem, however, because nobody can remember dozens of complex passwords. So use a password manager such as [1Password](https://1password.com/) or [Lastpass](https://lastpass.com/) to generate and remember them for you. 1Password has a [free service for journalists](https://1password.com/for-journalism/), including a "Travel Mode" to deactivate our password manager when crossing international borders (when your devices could be seized).

Protect your password manager account with a passphrase, consisting of a string of randomly-selected words.

If the words you pick are genuinely random, passphrases are much more secure than passwords, because they offer many more combinations. They are also easier for you to remember. (Indeed, they're the opposite of traditional "strong" passwords, which perversely are hard for people to remember but easy for machines to guess.) As is often the case, [XKCD](https://xkcd.com/936/) is a source of wisdom:

![](http://imgs.xkcd.com/comics/password_strength.png)

[This article](https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/) explains how to create a strong passphrase using a method called Diceware. Using the method explained here, a five-word passphrase would require an average of 14 quintillion attempts to crack -- that's 14 followed by 18 zeroes, which would challenge even the NSA. [Here](https://diceware.dmuth.org/) is a convenient Diceware passphrase generator.


### Encrypt your hard drives (internal and external)

If your laptop is stolen or lost, a login password or passphrase offers little protection for your files and other information: A hard drive can simply be removed and booted on another machine. So you should routinely encrypt your hard drives. [This post](https://support.apple.com/en-us/HT204837) explains how to encrypt a hard drive on the Mac, using FileVault; [this post](https://www.howtogeek.com/234826/how-to-enable-full-disk-encryption-on-windows-10/) explains the equivalent procedure on Windows, using BitLocker (included in Professional, Enterprise, or Education versions, but not Home version), or Veracrypt. (Do pay attention to the instructions on ensuring that you don't get locked out of the drive!)

Once you have set up disk encyrption, your operating system automatically encrypts any data saved to the encrypted disk. To anyone without the password/key, the data on the disk will be gibberish.

Protect your encrypted drives with strong passwords (for instance a 100-digit password generated by a password manager), or a strong passphrase.


### Remove files from your computer
Deleting files does not destroy them, so to remove traces you need to overwrite them multiple times. [Eraser](https://eraser.heidi.ie/) will do that on Windows; see [this article](https://www.macworld.com/article/1166104/security/how-to-securely-delete-files.html) for how to securely delete files on the Mac. I use [CleanMyMac](https://macpaw.com/cleanmymac), which as well as deleting junk from my hard drive has a file "shredder."


### Use two-factor authentication for web services, especially for email

A web-based email account is an Achilles heel for security, because that's where password reset instructions will be sent. If it is breached, an attacker can change your other passwords at will. So when using webmail, make sure to use two-factor authentication, which requires both a password and another means of authentication. Set up two-factor authentication for your GMail/Google account [here](https://www.google.com/landing/2step/).

There are two main ways of delivering the second code: Via a text message sent to your phone, or using an authentication app. It is possible for [text messages to be hijacked](https://www.wired.com/2016/06/hey-stop-using-texts-two-factor-authentication/), so nowadays security experts recommend using an app such as [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en_US) or [Duo](https://guide.duo.com/third-party-accounts).

Take advantage of two-factor authentication for web services wherever it is available.

### Make secure backups, and share files securely across multiple devices

Backing up your files is vital, and these backups should be secure. When backing up to an external hard drive, make sure that this drive is encrypted and protected by a secure password or passphrase.

I would also strongly recommend backing up files to a remote encrypted server. I use [SpiderOak One](https://spideroak.com/one/). As well as allowing you to back up your files, it creates a folder called SpiderOak Hive that will sync files and folders dropped into it across multiple devices. This folder similar to Dropbox, except the files are encrypted on SpiderOak's servers. It allows you to work securely on the same files across multiple devices. Importantly, SpiderOak cannot break the encryption on your files, either those backed up or synced through the Hive folder. Prices depend on how much storage you require.


### Let's not get paranoid: Consider the threat

The simple steps above will greatly improve your digital security. But there are many more steps that can be taken to keep your communications and online activity private. Those you choose to employ will depend on the circumstances, which involves considering the threat, as follows:

- **What do I need to keep secret?** (e.g. content of communication, source identities, files.)
- **Who do I need to keep it secret from?** (The "adversary," e.g. government, source's employer, competing news organizations.)
- **What can they do to find out?** (Consider technical, legal, and social means.)
- **What happens if they do find out?** (This is the risk, and will tell you how determined you need to be.)

[This article](https://source.opennews.org/en-US/learning/security-journalists-part-two-threat-modeling/) provides a good overview of how to weigh these questions, and act upon the answers.

### Web browsing in private

Every time you visit a website you reveal your:

- **Operating system**
- **Regional and language settings**
- **Connection’s “host name”** This may allow people to guess your name, email address and so on
- **IP address** This may identify where you work. Even surfing from home, IP addresses may identify you -- for example they can appear next to messages left in online communities, which can be Googled.
- **Referring page** This reveals the link from which you clicked, or your search terms, if you are coming from a search engine.

[This site](https://www.ip-secrets.com/) reveals the information you display to any website you visit.

Websites can also deposit tracking “[cookies](https://en.wikipedia.org/wiki/HTTP_cookie)” on your machine. If you want to block attempts to track you online, try the Privacy Badger add-on for [Chrome](https://chrome.google.com/webstore/detail/privacy-badger/pkehgijcmpdhfbdbbnkijodmdjhbjlgp?hl=en-US) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/). Be aware, however, that it will interfere with the functionality of some websites.

Note that the "private" browsing options in web browsers are not really private -- all they do is block cookies, and prevent your activity being stored in your browser's history.

For some investigations, you may want to explore a particular website without revealing your identity. For this, you can use an anonymous proxy server such as [ProxySite](https://www.proxysite.com/) or [kproxy](https://www.kproxy.com/).

For a more systematic approach to anonymous web browsing, consider using the [Tor](https://www.torproject.org/) browser or a Virtual Private Network (VPN).

As [this article](https://thetinhat.com/tutorials/darknets/tor-vpn.html) explains, Tor and VPNs are rather different.

Tor, which is based on Firefox, encrypts your data and connects you to one server in its network, which then bounces it on to two more servers before you are connected to the site you are browsing. Crucially, the second and third links in the chain only know the previous link, so your identity remains hidden.

All of this means that the website you are visiting doesn't know who or where you are, anyone trying to snoop on your connection cannot see which site you are connecting to, and neither can your Internet Service Provider (ISP). While it is in theory possible for the NSA to deanonymise Tor users, for most purposes Tor offers reliably anonymous browsing.

The downside of all this bouncing around the internet is that connections are slow. Also, using Tor effectively, without compromising your anonymity, means changing aspects of your online behavior -- such as avoiding insecure browser plugins and never opening downloaded documents while online using Tor.

If you subscribe to a VPN, your connection is encrypted and sent to the provider's server, which then connects to the site you are visiting. Again, your true identity and location is hidden from that site, and anyone trying to intercept your connection will just see gibberish being sent to the provider's server. The same goes for your ISP.

VPNs are much faster than Tor, but the provider can see all of your traffic -- so your anonymity ultimately lies in its hands. Will it hand over your browsing information if asked by a government agency? Read providers' privacy policies, but be aware that they may change, or not be followed under all circumstances.

[NordVPN](https://nordvpn.com/) and [Private Internet Access](https://www.privateinternetaccess.com/) are both relatively inexpensive and offer connections via servers in multiple countries across the world.

In general, VPNs are a good option for relatively low-threat situations where you require a fast connection. For example, it is a good idea to use a VPN whenever using an insecure connection, such as airport or coffee-shop wifi. If you really *need* to remain anonymous, however, Tor is your best option.

Google and other search sites [routinely store your searches](https://startpage.com/eng/protect-privacy.html). For private web searching, use [startpage](https://www.startpage.com/) or [DuckDuckGo](https://duckduckgo.com/).

### Encrypted communications

Especially when communicating with confidential sources, you need to set up a secure channel.

#### Signal

This is by far the easiest option, and is very secure.

Signal is [available](https://signal.org/download/) for iPhone, Android, and Desktop (Mac, WIndows, and Linux). It allows you to send encrypted texts, make encrypted telephone calls, and exchange longer messages and files.

It is also very easy to set up. I regularly communicate with my editors and fellow reporters over Signal, and encourage sources to use it, too.

For each of your contacts, Signal also allows you to select a "disappearing messages" option, which will automatically delete the messages after a set period of time after they are read, from a five seconds to a week.

I recommend that you use Signal as much as possible. It is no less convenient than regular cell phone use and messaging.

#### WhatsApp

[WhatsApp](https://www.whatsapp.com/) now [includes encryption](https://blog.whatsapp.com/10000618/end-to-end-encryption) as standard.

I choose not to use WhatsApp regularly because of its ownership by Facebook, which has policies on privacy and data harvesting have long disturbed me. (Google also harvests large amounts of data, but I find its products to be much more useful, so I'm willing to make that bargain.)

#### Email

Unencrypted email is an extremely insecure means of communication. You should think of emails as electronic postcards that can be read by anyone who intercepts them as they travel over the internet.

You can encrypt your emails using public key encryption, which depends upon a “keypair,” two unique strings of randomly generated numbers and letters, which are linked together by a mathematical algorithm. You have two keys, one public, one private.

You can store your public key in the open in an online [keyserver](https://en.wikipedia.org/wiki/Key_server_%28cryptographic%29), or can simply email it to someone you want to communicate with securely. Other people can use this key to encrypt a message or file so that only you can read it, by decrypting it using your private key. It is vital, therefore, that you keep your private key secure.

Encrypting an email is like putting a note in an envelope that can only be opened by the intended recipient. But note that only the body of the message is encrypted. Your identity, the identity of the recipient, and the subject line are all still readable by anyone intercepting the message.

Because email addresses are easy to spoof, you need to know that someone is who they say they are before setting up an encyrpted communication with them. Public encryption keys have signatures, and here is mine: `225F B2AF 4B8E 6E3D B1EA 7F9A B96E BF7D 9CB2 9B16`. Ideally, you will verify the intended recipient's identify in person, when they can also show you the fingerprint of their public key on their computer. People may also publish their fingerprints on a trusted website.

The simplest way to set up encrypted email is using [Mailvelope](https://www.mailvelope.com/en), which will work with most major webmail services, including GMail. Mailvelope can be installed as an extension for [Chrome](https://chrome.google.com/webstore/detail/mailvelope/kajibbejlbohfaggdiogboambcijhkke) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/mailvelope/), following the instructions [here](https://www.mailvelope.com/en/help).

Still, encrypted email is more complicated than Signal, and I've seen reasonably technically-savvy people make mistakes that compromise their security. (Twice I've had people send me their private keys, as well as their public ones.)

So I'd recommend using Signal for encrypted communication, especially with sources who may not have great technical expertise.

#### Video conferencing

For secure video conferencing, you can use [Jitsi Meet](https://meet.jit.si/), which works in your browser.

### Remember: Cellphones are personal tracking devices

GPS-enabled phones are personal tracking devices, and may not be fully powered off even if switched off. If you are using a cellphone to communicate with a confidential source, you may want to use a prepaid cellphone, paid for with cash. Switch off and remove the battery when not in use. Don't take your cellphone to meetings with sources whose identity must remain confidential.

#### Hiding your phone number

- *67 blocks caller ID
- You can spoof caller ID with [SpoofCard](https://www.spoofcard.com/).

### Basic e-sleuthing

#### Who sent this email?

As noted above, emails are easy to spoof. People may also use throwaway emails using false names. You can find out something about the origin of an email, however, through its header, see [here](https://mxtoolbox.com/public/content/emailheaders/) for how to find and extract).

Having copied an email's header, paste into the boxes [here](https://whatismyipaddress.com/trace-email) or [here](https://www.ip-adress.com/trace_email/).

Note that emails sent from Gmail's webmail interface will always locate to Google's headquarters in Mountain View -- so a throwaway Gmail account offers little information. If a Gmail was sent using an email client such as Thunderbird or Outlook, however, information from the IP address of the host machine will be revealed.

#### Who is behind this website?

[Whois](https://www.easywhois.com/) [searches](http://whois.domaintools.com/) provide information on the underlying IP address and registration information, from a url. However, as a reaction to European Union data privacy rules, Whois information is [increasingly being redacted](https://umbrella.cisco.com/blog/2018/05/31/gdpr-and-whois/).


#### What other websites are hosted at the same IP address?

This [search](https://reverseip.domaintools.com/) will perform reverse IP lookups, listing other websites hosted at the same IP address. That may be useful in investigations in which you are trying to identify constellations of websites operated by the same source -- however, bear in mind that it doesn't reveal much if your target is using a large commercial webhosting provider.

#### What is the history of this website?

The Internet Archive's [Wayback Machine](https://web.archive.org/) can be used to find old versions of websites. You can also save pages that have not already been archived.

#### Monitor websites for changes

At [Visualping](https://visualping.io/), you can set up alerts to monitor websites for changes, and notify you when they occur. It is also available as a browser add-on for [Chrome](https://chrome.google.com/webstore/detail/visualping/fbhjaehnpccniaiedddkbdhgicmcmgng?hl=en). Similar add-ons include Distill Web Monitor, available for [Firefox](https://addons.mozilla.org/en-US/firefox/addon/distill-web-monitor-ff/) or [Chrome](https://chrome.google.com/webstore/detail/distill-web-monitor/inlikjemeeknofckkjolnjbpehgadgge?hl=en).

As we’ve already noted: Websites are likely to change if their owners realize that information on the site is incriminating. So save web pages that are key to an investigation! I simply print and use the save to PDF option in Chrome.


### Researching people

Searching for information on individual people can be difficult, without access to a commercial research tool such as [LexisNexis Public Records](https://www.lexisnexis.com/en-us/products/public-records.page), or TransUnion's [TLOxp](https://tloxp.tlo.com/).

I used LexisNexis Public Records extensively to research living people for [this article](https://www.buzzfeednews.com/article/peteraldhous/golden-state-killer-dna-experiment-genetic-genealogy) on identifying my colleagues using genetic geneaology. [BeenVerified](https://www.beenverified.com/) may be an affordable alternative if you don't work for a newsroom with access to LexisNexis or TLOxp.

In my experience, most free online search sites that offer background checks, contact information, and so on, are not worth using.

Nowadays, I regularly use LinkedIn to find sources, especially when I need to reach people who work or who have worked for particular organizations, and to contact sources who keep their emails and phone numbers out of the public domain. [LinkedIn Premium](https://premium.linkedin.com/) is very useful for finding and communicating with these people. If you are a professional journalist (so you may have to wait until you're out in the world of employment!) you can ask to join the [LinkedIn for Journalists](https://www.linkedin.com/groups/3753151/profile) group. You should then get an invitation to attend a webinar, and once you've done that you'll be granted a free premium account. It offers some improved search features, but the main benefit is InMail, which allows you to send messages to people who are not in your contacts on LinkedIn.

### Facebook

Facebook is an incredibly useful resource for finding people and connections between them. Again, I used it extensively for my genetic genealogy story, looking at public friend lists, posts, and profiles to discover how individuals were related to one another.

Unfortunately, recent changes made to the [Facebook's search functionality](https://en.wikipedia.org/wiki/Facebook_Graph_Search) have made it much harder to systematically search for information on the platform.

Still, [Who posted what?](https://www.whopostedwhat.com/) remains a useful tool for searching the platform, allowing keyword searches for specific time periods. You can also enter the url for someone's profile page to find their Facebook ID, then use that ID to run keyword searches on posts by that user.

As a journalist, remember that you can be researched in the same way, and if your posts and friend lists are public, this information could be used by people who wish to undermine your credibility, embarrass, or harm you or your friends. Be especially careful with your personal [Facebook privacy settings](https://www.facebook.com/settings?tab=privacy). I would recommend hiding your friend list from public view, and limiting access to your posts to friends only. You may want to set up a separate account for professional purposes to highlight your work, and enable the [Follow feature](https://www.facebook.com/help/382751108453953/) for that.

### Bellingcat Online Investigation Toolkit

[Bellingcat](https://www.bellingcat.com/) is an "independent international collective of researchers, investigators and citizen journalists using open source and social media investigation." It has a [compiled an extensive collection of tools](https://docs.google.com/document/d/1BfLPJpRtyq4RFtHJoNpvWQjmGnyVkfE2HYoICKOGguA/edit) for online investigations.

In class we'll explore the use of reverse image search to investigate the origin of some images posted on the website of the [defunct microbiome company uBiome](https://www.businessinsider.com/ubiome-what-we-know-microbiome-startup-fbi-raid-ceos-resigned-2019-7), and look at image metadata to find out when a number of prominent scientists visited Jeffrey Epstein's private island.


### Further reading

[Security for Journalists, Part One: The Basics](https://source.opennews.org/en-US/learning/security-journalists-part-one-basics/)
Good article on the basics of digital security, by Jonathan Stray.

[Chatting In Secret While We're All Being Watched](https://theintercept.com/2015/07/14/communicating-secret-watched/)
Overview article from the Intercept, covering some of the services mentioned in these notes, and more.

[Ed Snowden Taught Me To Smuggle Secrets Past Incredible Danger. Now I Teach You.](https://theintercept.com/2014/10/28/smuggling-snowden-secrets/)
Intercept article by Micah Lee, who helped get Edward Snowden in encrypted contact with Laura Poitras and Glenn Greenwald.


