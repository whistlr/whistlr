Em.I18n.translations =
  static:
    home:
      header: "About Whistlr"
      content: "Coming soon."
    welcome:
      header: "Welcome to Whistlr"
      text1: "The site is still young and there's plenty of opportunity to workdesk. Catalog businesses and officials, report on their activities, and help us map out threads of power and ethical responsibility."
  affiliations:
    form:
      tips:
        organization: "The organization this official is affiliated with."
        official: "The official this organization is affiliated with."
    contributees:
      attributes:
        amount: "Amount"
      form:
        tips:
          amount: "The total amount in dollars given to the official by this organization."
      versions:
        submitted:
          "{{user}} reports that {{official}} received a contribution from {{organization}}."
        revised:
          "{{user}} revised the report that {{official}} received a contribution from {{organization}}."
    executives:
      attributes:
        title: "Title"
        amount: "Salary"
        dates: "Dates"
        startDate: "Start Date"
        endDate: "End Date"
      form:
        tips:
          title: "The official's title, such as CEO, Vice President of Communications, or Senator. If the official has had multiple titles with this organization, submit each one as a separate affiliation."
          amount: "The yearly salary of this official in dollars. If the salary changed from year-to-year, use the latest salary. Include bonuses if applicable."
          startDate: "The year the official began his or her term."
          endDate: "The year the official ended his or her term."
      versions:
        submitted:
          "{{user}} reports that {{official}} was an executive of {{organization}}."
        revised:
          "{{user}} revised the report that {{official}} was an executive of {{organization}}."
    owners:
      attributes:
        shares: "Percent Ownership"
      form:
        tips:
          shares: "The percentage of this organization that the official owns."
      versions:
        submitted:
          "{{user}} reports that {{official}} has a share in {{organization}}."
        revised:
          "{{user}} revised the report that {{official}} has a share in {{organization}}."
  compliments:
    controversal_officials: "Controversal Officials"
    disfavored_officials: "Unpopular Officials"
    favored_officials: "Favored Officials"
    controversal_organizations: "Controversal Organizations"
    disfavored_organizations: "Unpopular Organizations"
    favored_organizations: "Favored Organizations"
    controversal_products: "Controversal Products"
    disfavored_products: "Unpopular Products"
    favored_products: "Favored Products"
  devise:
    register: "Register"
    sign_up: "Sign Up"
    sign_in: "Sign In"
    sign_out: "Sign Out"
    remember_me: "Remember me?"
    already_have_an_account: "Already a member? <strong>Sign in</strong>"
    are_you_new: "Are you new here? <strong>Setup an account</strong>"
    forgot_your_password: "Forgot your password?"
    reset_password: "Reset Password"
    registration_successful: "Registration successful. You'll find a confirmation email in your inbox. Please read it and confirm your account."
    sign_in_successful: "Sign in successful."
    sign_out_successful: "Sign out successful. Redirecting to homepage."
    attributes:
      error: ""
  explore:
    header: 'Explore'
  workdesk:
    header: 'Workdesk'
    officials:
      new_officials: 'New Official'
    organizations:
      new_organizations: 'New Organization'
    products:
      new_products: 'New Product'
    recent_activity: 'Recent Activity'
    about_recent_activity: "To receive updates about edits and reports, click the 'Follow' button on an organization, official, or product. Those updates will appear here for your convenience."
  flash:
    resource_edited: "Your edit was successfully submitted. It is now awaiting peer review. You can check its progress by clicking on the 'Timeline' link in the top right corner of this page."
    resource_submitted: "Your submission was successful. It is now awaiting peer review. You can check its progress by clicking on the 'Timeline' link in the top right corner of this page."
  form:
    tips:
      notes: "If you want, you can leave notes for the peer reviewers. These are helpful if something about your submission is unusual, or if you feel the need to leave references.\r\rThese notes will only be visible to reviewers. They will not be displayed on the front-end."
      facebook: "To get an organization's Facebook alias, visit their Facebook page and look at their URL. For instance, Whole Food's URL is:\r\r    www.facebook.com/wholefoods\r\rSo their alias would be:\r\r    wholefoods\r\rIn some cases, the URL is longer:\r\r    www.facebook.com/pages/Hatch-Workshop/193953577353585\r\rNote the presence of 'pages' and a long number at the end. In such cases, the alias is the long number:\r\r    193953577353585"
      twitter: "To get an organization's Twitter alias, visit their Twitter page and look at their URL. For instance, Bed Bath & Beyond's URL is:\r\r    twitter.com/BedBathBeyond\r\rSo their alias would be:\r\r    BedBathBeyond"
      website: "The full URL for the organization's public-facing website. Eg:\r\r    http://www.cia.gov/\r\r    http://www.aljazeera.com/\r\r    http://www.scientology.org/\r\r    http://austintexas.gov/"
  layout:
    header:
      workdesk: 'Workdesk'
      discuss: 'Discuss'
      explore: 'Explore'
      search_bar: 'Search'
      whistlr: 'Whistlr'
  officials:
    one: "Official"
    other: "Officials"
    attributes:
      bio: 'Bio'
      facebook_alias: 'Facebook Alias'
      image: 'Portrait'
      name: 'Name'
      twitter_alias: 'Twitter Alias'
      website: 'Website'
    edit:
      header: 'Edit Official'
    form:
      tips:
        bio: "A brief biography of the official, preferably under 500 characters."
        name: "The official's full name."
    new:
      header: 'New Official'
      p1: "An <em>official</em> can include any public figure, from elected representatives to board members of a company."
    organizations:
      employed_by: "Executive"
      stock_in: "Owner"
      received_contributions: "Contribution Recipient"
    reports:
      header: "Reports"
    timeline:
      header: "Timeline for Official"
    versions:
      revised: "{{user}} proposed revisions to the official {{official}}."
      submitted: "{{user}} submitted the official {{official}}."
  organizations:
    one: 'Organization'
    other: 'Organizations'
    attributes:
      city: 'City'
      country: 'Country'
      facebook_alias: 'Facebook Alias'
      image: 'Logo'
      name: 'Name'
      parent: 'Parent Organization'
      region: 'Region'
      twitter_alias: 'Twitter Alias'
      website: 'Website'
    edit:
      header: 'Edit Organization'
    form:
      tips:
        city: "The city in which the organization is headquartered.\r\r - New York City\r - Austin\r - Seattle\r - Archorage\r\rGovernmental organizations do not need to input anything here unless they administer on a municipal level, such as a city council or sheriff's office."
        country: "The country in which the organization is headquartered.\r\rAlternatively, if it's a governmental organization, the country which it administers.\r\r - United States of America\r - People's Republic of China\r - Federative Republic of Brazil\r\rInternational governmental organizations do not need to input anything here."
        name: "This is the only required field. Go ahead and leave the organization's full name, eg:\r\r - Coca-Cola Company\r - Apple Inc.\r - Massachusetts Institute of Technology\r - United States of America\r - National Security Agency"
        parent: "If this organization is a subsidiary or department of a larger organization, give the name of the immediate parent.\r\rFor instance, Quaker Oats Company is owned by PepsiCo, so the parent would be 'PepsiCo'.\r\rSimilarly, the National Security Agency is a part of the United States Department of Defense, so the parent would be 'United States Department of Defense'."
        region: "The region in which the organization is headquartered, such as a state or province.\r\r - California\r - New York\r - Texas\r - British Columbia\r - New South Wales\r\rInternational and national governmental organizations do not need to input anything here."
    new:
      header: 'New Organization'
      p1: "Our definition of <em>organization</em> is inclusive by design. It encompasses everything from corporations to governments to fraternal orders to&mdash;well, any other institution you can think of."
    officials:
      employed_by: "Executives"
      stock_in: "Owners"
      received_contributions: "Contribution Recipients"
    profile:
      owned_by: 'Owned by '
    reports:
      header: "Reports"
    timeline:
      header: "Timeline for Organization"
    versions:
      revised: "{{user}} proposed revisions to the organization {{organization}}."
      submitted: "{{user}} submitted the organization {{organization}}."
  products:
    one: "Product"
    other: "Products"
    attributes:
      facebook_alias: 'Facebook Alias'
      image: 'Portrait'
      name: 'Name'
      organization: 'Organization'
      twitter_alias: 'Twitter Alias'
      website: 'Website'
    eans:
      one: "EAN-13"
      other: "EAN-13s"
      attributes:
        code: "EAN-13"
      new_ean: "Add EAN-13"
    edit:
      header: 'Edit Product'
    form:
      tips:
        ean13: "The product code."
        name: "The name of the product."
        organization: "The name of the organization that manufactures the product."
    new:
      header: 'New Product'
      p1: "A <em>product</em> might be a manufactured item, service, governmental policy, or media, such as a film or newspaper."
    profile:
      owned_by: 'Produced by {{user}}'
    reports:
      header: "Reports"
    timeline:
      header: "Timeline for Product"
    versions:
      revised: "{{user}} proposed revisions to the product {{product}}."
      submitted: "{{user}} submitted the product {{product}}."
  reports:
    one: 'Report'
    other: 'Reports'
    attributes:
      description: 'Description'
      summary: 'Summary'
      evidence:
        joins:
          evidence:
            citation: "Evidence Citation"
            url: "Evidence URL"
            file: "Evidence File"
        joins: "Evidence"
      participant:
        joins:
          participants:
            reportable_type: 'Participant Type'
            reportable_name: 'Participant Name'
            involvement: 'Participant Involvement'
            summary: 'Participant Summary'
        joins: 'Participants'
    edit:
      header: "Edit Report"
    evidence:
      one: "Evidence"
      other: "Evidence"
      add_evidence: "Add Evidence"
      attributes:
        citation: "Citation"
        url: "URL"
        file: "File"
      form:
        tips:
          citation: "The source's name and details. Use [MLA formatting][1].\r\r[1]: https://owl.english.purdue.edu/owl/resource/747/01/"
          url: "If using a web-based source, provided the url here."
      new: "New Report"
    form:
      tips:
        description: "A longer recounting of the events of the report."
        summary: "A brief (140 characters or less) description of the report. Remain as neutral as possible while still conveying key controversies."
    new: "New Report"
    participants:
      one: "Participant"
      other: "Participants"
      attributes:
        reportable_type: 'Participant Type'
        reportable_name: 'Participant Name'
        involvement: 'Involvement'
        summary: 'Summary'
      form:
        tips:
          involvement: "The role the participant played in the report, whether as a supporter or opponent."
          summary: "A brief (140 characters or less) description of the participant's role in the report. If left blank, will default to the report's main summary."
          reportable_type: ""
          reportable_name: "The name of the participant."
      involvement_types:
        primary_proponent: "Primary Proponent"
        active_proponent: "Active Proponent"
        vocal_proponent: "Vocal Proponent"
        vocal_opponent: "Vocal Opponent"
        active_opponent: "Active Opponent"
        primary_opponent: "Primary Opponent"
      new_participant: 'New Participant'
    timeline:
      header: "Timeline for Report"
    versions:
      revised: "{{user}} proposed revisions to the report: {{report}}."
      submitted: "{{user}} submitted a report: {{report}}."
  shared:
    collapse: 'Collapse [-]'
    edit: 'Edit'
    everything: 'Everything'
    expand: 'Expand [+]'
    follow: 'Follow'
    full_report: 'Full Report'
    general: 'General'
    load_more: 'Load More'
    loading_more: 'Loading More'
    main: 'Main'
    more: 'More'
    previous: 'Previous Version'
    this_version: 'This Version'
    timeline: 'Timeline'
    submit: 'Submit'
    unfollow: 'Unfollow'
    attributes:
      notes: 'Notes'
  users:
    one: 'User'
    other: 'Users'
    attributes:
      email: 'Email'
      password: 'Password'
      password_confirmation: 'Password Confirmation'
      name: 'Name'