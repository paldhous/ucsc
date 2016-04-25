# Backgrounding non-profits, companies and people

### Non-profits

In the U.S., non-profit organizations can be considered as charities, exempt from tax, if their activities fall under [exempt purposes](http://www.irs.gov/Charities-&-Non-Profits/Charitable-Organizations/Exempt-Purposes-Internal-Revenue-Code-Section-501%28c%29%283%29) specified by the Internal Revenue Service (IRS). These purposes are summarized by the IRS as "charitable, religious, educational, scientific, literary, testing for public safety, fostering national or international amateur sports competition, and preventing cruelty to children or animals."

Charities meeting these requirements are known as 501(c)(3) organizations, after the section of the U.S. tax code that governs their operations. As we will see, this includes some organizations with large turnovers. Some organizations have both commercial arms that are treated as for-profits, and non-profit arms that fall under 501(c)(3).

While 501(c)(3) organizations do not have to pay tax, they do have to submit an annual report to the IRS, known as a Form 990. As a journalist trying to gather basic information on a non-profit, the idiosyncratic Form 990 is your friend.

There are several versions of this form, with a condensed version for smaller non-profits, see [here](https://www.irs.gov/Charities-&-Non-Profits/Annual-Electronic-Filing-Requirement-for-Small-Exempt-Organizations-Form-990-N-e-Postcard). 501(c)(3) organizations with for-profit arms must file their taxable business income using a form called [990-T](http://www.irs.gov/instructions/i990t/).

We will consider the full Form 990, also known as 990-EO, filed by organizations with annual earnings of $200,000 or more, and assets of $500,000 or more.

Two websites provide a good starting point to search for non-profits and view their 990s:

##### [Guidestar](http://www.guidestar.org/)

From the homepage, you can search for non-profits by name. The advanced search page is [here](http://www.guidestar.org/AdvancedSearch.aspx). Once on the page for an individual non-profit, for example [here](http://www.guidestar.org/organizations/53-0196572/american-chemical-society.aspx) for the American Chemical Society, who will see a green bottun to the right to download the three most recent 990s:

![](img/class6_1.jpg)

You will need to [sign up](https://www.guidestar.org/Login.aspx) for a free account to view these forms. You can also pay for access to more reports and certain information extracted from them -- however, I have never found any need to do this.

##### [CitizenAudit](https://www.citizenaudit.org/)

This is a project set up by the data journalist [Luke Rosiak](http://www.lukerosiak.info/), originally with backing from the Sunlight Foundation. It is systematically digitizing 990s using optical character recognition, so that they become fully searchable. So not only can you use the search box on the home page to search for an organization and its 990s, but you can also search the documents for mentions of people, payments from one non-profit to another, and so on. There is a good write-up of its uses in journalism [here](http://www.icij.org/blog/2013/09/investigating-charities-how-search-finances-nonprofits-and-foundations).

For comparison with Guidestar, [here](https://www.citizenaudit.org/530196572/) is the page for the American Chemical Society:

![](img/class6_2.jpg)

The `Tax Documents (Form 990s)` tab should have links to 990-EO and 990-T documents going back over 15 years. The most recent ones should habe searchable **Raw text**. (You can also download the scanned PDFs and search them directly in a PDF viewer such as Adobe Acrobat or Preview.)

When CitizenAudit launched, it was entirely free. It has now become self-supporting, which means that after [40 searches or page views](https://www.citizenaudit.org/pages/faq/) from a particular IP address, you will be asked to sign up for a [paid account](https://www.citizenaudit.org/accounts/signup/). This limits its utility, however if you have a project for which you need to gather alot of information on non-profits, and particularly if you need to look at how money passes from one to another, buying a 30-day pass may be a worthwhile option. The full **Funders and Grantees** section, which lists organizations giving and receiving money to the non-profit in question, is only available with a paid account.

##### What's in a Form 990?

- **Part I** gives a summary of revenue and expenses over the past two years.

- **Part III** gives detail of expenses and revenue on program service -- a major, usually ongoing, activity of an organization that accomplishes its tax-exempt purpose.

- **Parts IV to VI** contain checklists verifying that the charity meets criteria for tax-exempt status, has appropriate governance and policies etc.

- **Part VII** lists and gives compensation for: 
A) Officers, directors and trustees and key employees.
B) Five current highest compensated employees paid more than $100,000.
C) Former officers, key employees and highest compensated employees paid more than $100,000.
D) Former directors and trustees who received more than $10,000.
E) Five highest paid independent contractors paid more than $100,000.

- **Part VIII** gives a breakdown of revenue.

- **Part IX** gives a breakdown of expenses into major functional categories.

- **Part X** is the balance sheet (a friendly accountant can help interpret this and other parts of the form).

**Schedules of interest:**

- **B** would be of great interest, as it lists major contributors and their donations. But is almost always missing, and if present names can be withheld. But there are often other ways of getting this information -- annual reports, plaques in the lobby etc.
- **C** documents political campaign and lobbying activities.
- **I** documents grants awarded.
- **J** has more details on compensation of directors, officers, key employees etc. 
- **L** Transactions with “interested persons.”
- **O** supplemental information, pay attention to this, as it contains the overspill from other parts of the form!
- **R** Related organizations.

##### An example Form 1990

Here is the latest (2014) Form 1990 for the American Chemical Society:



In class, we will use this form to answer the following questions:

- What was the ACS's total revenue in 2014?

- What were its total expenses?

- What was its total salary bill?

- What was the highest paid independent contractor?

- Who was the highest paid officer/employee, and how much did they earn?

- How much did the ACS spend on lobbying?

- What was the largest ACS grant awarded, and to which organization?

### Companies

If a company is public, meaning its shares are traded on a stock exchange, then the value of its shares, and the volume of their trading, can provide useful information about its general health, and reveal significant events affecting the company. [Google](http://www.google.com/finance) and [Yahoo](http://finance.yahoo.com/) both operate finance sites at which you can view these metrics over time.

In class, we will use Google Finance to explore the history of trading in the stock of Valeant Pharmaceuticals, which has become controversial after [being accused of price gouging](http://www.businessinsider.com/why-have-valeant-pharmaceuticals-shares-collapsed-2015-11).

At Google Finance, you can view the graphs of stock value and trading volume over various periods (up to ten years), and compare both to **Related companies**, listed below the graph, or standard indices such as the Dow Jones Industrial Average. Companies can be searched by their full names, or by their abbreviated stock market [ticker](http://en.wikipedia.org/wiki/Ticker_symbol) -- VRX in the case of Valeant.

Yahoo finance also allows you to download data on the stock value history of companies by constructing urls of the following form:

**Valeant:**

```SQL
http://real-chart.finance.yahoo.com/table.csv?s=VRX
```

**Dow Jones Industrial Average:**

```SQL
http://real-chart.finance.yahoo.com/table.csv?s=^DJI
```

Search [here](http://finance.yahoo.com/lookup) for the tickers/symbols for companies and indices to use in constructing these urls.

- - -

Public companies are regulated by the [**Securities and Exchange Commission**](https://www.sec.gov/about/whatwedo.shtml) (SEC), which describes its role as to "protect investors, maintain fair, orderly, and efficient markets, and facilitate capital formation." Traded companies are obliged to report certain information to the SEC, which you can view by searching for them at the SEC's main [company search page](https://www.sec.gov/edgar/searchedgar/companysearch.html).

At the page for each company, you will find its filings to the SEC over time. Here is a guide to the codes for some of the most important documents:

- **10-K** is the annual report, giving  year-end financial statements, a history of the company, legal entanglements, insider conflicts of interest and a detailed management discussion of the company’s prospects. The section marked **Risk Factors** is especially informative. It is where a company describes all the things that might harm its prospects. This is where companies speak the truth that otherwise they would never utter -- they do this here because it protects them from being accused by the SEC of misleading investors if they get into serious financial trouble. [Here](https://www.sec.gov/Archives/edgar/data/1076481/000119312510057418/d10k.htm) is the 10-K filed for 2009 by the diagnostics company Sequenom, in which this section makes for particularly interesting reading!

- **10-Q** is the quarterly financial report.

- **DEF 14A** is the proxy statement, which gives salaries, bonuses and stock holdings of top executives. It also gives biographies of some executives and directors, and lists the largest shareholders.

- **8-K** announces important breaking news that may affect the stock price. Biomedical companies, for example, will report key results from clinical trials here.

- **Form 4 and Schedule 13D** report stock transactions by insiders and key shareholders.

You can search for SEC enforcement actions [here](http://www.sec.gov/litigation.shtml). Try searching for Sequenom and see what you find!

[Here](https://searchwww.sec.gov/EDGARFSClient/jsp/EDGAR_MainAccess.jsp) is the SEC's full text search, which can be useful, for example, for finding references to individuals, and privately held companies, in documents filed by publicly traded companies.


- - -


**[Sqoop](sqoop.com/)** is a new site that aims to provide a one-stop-shop for information on companies. Sign up for a free account [here](http://sqoop.com/users/sign_up).

You can search using the names of companies, individual corporate officers, or keywords, and it will return links to SEC filings, Patents and cases in in federal courts. (You will still need a login for the [PACER](https://www.pacer.gov/) federal court search system to access federal court documents.)

Here are the results for a search on Valeant:

![](img/class6_3.jpg)

You can save a search to receive updates by email of new documents.

If you are a local reporter, Squoop also provides the option to [narrow your SEC filing searches by geography](http://sqoop.com/blog/2016-03-11-geographic-search). Click on the `Locations` button after running your search to activate this option.

Sqoop is currently made freely avilable to journalists, as it tries to expand its user based. It is a for-profit, however, so it is possible that charges will be introduced in future.

- - -

It is much harder to do background research on privately held companies, which do not have to file reports to the SEC. So think about the agencies (state and federal) that have some oversight or regulatory role. For example, a company running animal experiments will have to file reports about its use of animals to the U.S. Department of Agriculture's Animal and Plant Health Inspection Service, which can be searched [here](https://acissearch.aphis.usda.gov/LPASearch/faces/CustomerSearch.jspx).

While somewhat dated, [here](backgrounding_companies.pdf) is a useful guide to backgrounding privately held companies.

In the U.S., companies are registered with the authorities in the state they call home. You can search for businesses registered in California [here](http://kepler.sos.ca.gov/). You can order basic documents about companies' registration [using this form](http://bpd.cdn.sos.ca.gov/pdf/be-records-requests.pdf).

But be aware that the name a company trades under may not be its registered name. To find out the registered name, you may need to run a "fictitious business name" search at the county level. [Here](http://sccounty01.co.santa-cruz.ca.us/clerkrecorder/Asp/FBNInquiry.asp) is the search site for Santa Cruz County, and [here](http://www.brbpub.com/) is useful a site from which you can navigate down to all sorts of public records at state and country levels, including fictitious business name searches.

[**OpenCorporates**](https://opencorporates.com/) is an ambitious effort to build a database of information on companies throughout the world.

### People

Searching for information on individual people can be difficult, without access to a commercial research tool such as [Accurint](http://www.accurint.com/). In my experience, most online search sites that offer background checks, contact information, and so on, are more effective at parting you from your money than providing good information.

Again, it helps to think about official agencies to which individuals must report information. [Who Is John Doe](http://www.reporter.org/desktop/tips/johndoe.htm), a site put togther by investigative reporter [Duff Wilson](http://www.journalism.columbia.edu/profile/395-duff-wilson/10), provides a very useful guide to potential sources of information. [Here](http://www.peoplesearchpro.com/journalism/people/) is another site that provides links to various people-searching resources.











