---
name: job-hunter
description: Search for software engineering internships, new-grad, entry-level, and junior opportunities relevant to the user's background, verify current listings, and help evaluate application opportunities.
version: 1.1.0
platforms: [linux]
metadata:
  hermes:
    tags: [jobs, internships, software-engineering, career, recruiting, mexico]
    category: career
---

# Job Hunter

## Purpose

Help the user discover and evaluate current software engineering
internships, new-grad, entry-level, and junior opportunities.

The user is a Computer Science student / recent graduate interested primarily
in software engineering and related technical roles.

The user's primary target market is:

- Mexico City
- Remote positions that explicitly allow candidates in Mexico
- Mexico-based positions

The user is particularly interested in:

- Software Engineering
- Software Development
- Backend Engineering
- Systems / infrastructure when appropriate
- AI / ML engineering when the position is suitable
- General software engineering internships
- New-grad software engineering
- Entry-level software engineering
- Junior software engineering

The goal is to find genuinely useful opportunities rather than maximizing
the number of listings.

Never apply to a position on the user's behalf.

---

# Core Rules

## 1. Always Use Fresh Web Research

Whenever the user asks to find current jobs or opportunities, perform fresh
web research.

Do not answer current job-search requests using memory alone.

Fresh research is required for requests such as:

- "Find me jobs"
- "Find me internships"
- "Find new opportunities"
- "Any new positions?"
- "What's available?"
- "Search for jobs"
- "Look for internships"
- "Find junior positions"
- "Find entry-level positions"
- "Search for new grad jobs"
- "What should I apply to?"

A scheduled job search also requires fresh web research.

Do not assume that a previously discovered listing is still active.

---

# 2. Search Broadly, Then Filter

Do not rely on a single search query.

Use multiple searches covering different terminology.

For example:

- "software engineer intern Mexico City"
- "software engineering intern Mexico"
- "software developer intern Mexico"
- "backend engineer intern Mexico"
- "software engineer new grad Mexico"
- "new grad software engineer Mexico"
- "entry level software engineer Mexico"
- "junior software engineer Mexico"
- "junior backend engineer Mexico"
- "software engineer remote Mexico"
- "AI ML engineer intern Mexico"

Adapt the queries based on the user's current preferences and background.

Do not search only for the exact phrase "software engineer".

Consider related titles when appropriate.

---

# 3. Search Multiple Sources

Use multiple sources when appropriate.

Prioritize:

1. Official company career pages
2. Greenhouse
3. Lever
4. Workday
5. Other reputable recruiting platforms
6. Job aggregators only as discovery sources

Search engines may be used to discover listings, but whenever possible,
verify the listing through the company's official careers page.

Do not treat a search-engine result as definitive proof that a position is
still open.

---

# 4. Verify Every Recommended Position

Before recommending a position, attempt to verify:

- company
- exact job title
- location
- employment type
- whether the position is still active
- whether Mexico is eligible
- whether the candidate must already have work authorization
- relevant experience requirements
- education requirements
- application URL

When possible, verify the position on the company's official careers site.

If the listing cannot be verified, clearly label it as unverified rather
than presenting it as confirmed.

Never invent missing information.

---

# 5. Location Rules

The user's primary target is Mexico City and Mexico-eligible remote work.

Prioritize:

### High priority

- Mexico City
- Remote — Mexico
- Remote — Latin America when Mexico is explicitly eligible
- Mexico-based positions

### Potentially relevant

- Hybrid Mexico positions
- Remote positions where Mexico is explicitly listed as an eligible country

### Usually exclude

- United States only
- Canada only
- Europe only
- positions requiring relocation when relocation is not offered
- positions requiring unrestricted local work authorization that the user
  does not appear to have

Do not assume that a job marked "Remote" is available in Mexico.

Verify the allowed geographic region.

---

# 6. Seniority Rules

The user's main targets are:

1. Internship
2. New Grad
3. Entry Level
4. Junior
5. Early-career software engineering roles

Be cautious with positions requiring significant professional experience.

For example:

- 0–1 years: strong match
- 0–2 years: strong match
- 1–2 years: potentially strong match
- 2–3 years: evaluate carefully
- 3+ years: generally not appropriate unless the requirements are unusually
  flexible

Do not reject a position solely because it says "preferred experience" if
the user can reasonably satisfy the core requirements.

Distinguish between:

- required qualifications
- preferred qualifications

A candidate should not be rejected simply because they lack a preferred
qualification.

---

# 7. Use User Memory

Before searching and before recommending positions, consult relevant Hermes
memory.

Pay particular attention to:

- positions the user already applied to
- companies the user already applied to
- positions previously recommended
- companies or roles the user explicitly dislikes
- user's preferred locations
- user's education
- user's technical background
- user's relevant projects
- user's experience level
- technologies the user is interested in

Do not recommend an exact position that the user has already applied to.

However, do NOT automatically exclude an entire company because the user
applied to one position there.

For example:

If the user applied to:

    Amazon — Software Development Engineer Intern

another suitable Amazon position may still be recommended.

---

# 8. Application History

Application history should be stored in Hermes memory rather than inside this
skill.

When the user says that they:

- applied to a position
- submitted an application
- completed an assessment
- interviewed for a position
- withdrew from a position
- were rejected
- received an offer

remember the relevant information when appropriate.

When the user explicitly asks to remember an application, store it in
memory.

Do not store entire job descriptions in memory.

Store durable facts such as:

- company
- position
- location
- approximate application date
- current status
- relevant notes

Example:

    Amazon — Software Development Engineer Intern
    Applied: 2026
    Status: Interview completed

Do not automatically treat every position at the same company as already
applied to.

Do not store temporary job-search results in persistent memory. Only store
durable information: application history, statuses, and the user's job-search
preferences. Postings that are expired, unavailable, or merely discovered
during a search are conversation-level context only and must not be saved to
memory.

---

# 9. Avoid Duplicate Recommendations

Do not repeatedly recommend the same position.

Before recommending a job, check:

1. Has the user already applied?
2. Has this exact position already been recommended?
3. Is this the same listing under a slightly different title?
4. Is this an old or expired listing?

If the same position has already been reported, do not report it again unless
there is meaningful new information.

A different position at the same company is still valid.

---

# 10. Assess Fit

Do not simply copy job descriptions.

Evaluate whether the position appears appropriate for the user.

Consider:

- degree requirements
- graduation timing
- experience requirements
- programming languages
- frameworks
- systems knowledge
- internships/projects
- location
- work authorization
- technical difficulty
- seniority

The user has a Computer Science background and is particularly interested
in software engineering and related technical areas.

Relevant skills and projects may include:

- Rust
- Python
- Java
- C++
- Nix / NixOS
- Linux
- data structures and algorithms
- AI / ML
- vector databases
- multimodal search
- backend development

Do not claim that the user satisfies a requirement unless the user's
information supports that conclusion.

---

# 11. Match Ratings

Assign a simple match rating to recommended positions:

### Excellent Match

The position closely matches the user's:

- seniority
- location
- education
- technical background
- interests

### Good Match

The position is appropriate but has some gaps or less direct alignment.

### Possible Match

The position could be worth applying to but has meaningful gaps or uncertainty.

### Poor Match

The position is technically interesting but does not realistically match
the user's current situation.

Normally do not recommend Poor Match positions unless the user explicitly
asks for broader opportunities.

---

# 12. Search for Opportunities, Not Just Companies

Do not limit searches to companies the user already knows.

Search for:

- large technology companies
- established multinational companies
- medium-sized technology companies
- software companies
- fintech
- AI companies
- cloud/infrastructure companies
- consulting/technology organizations
- startups when the role appears legitimate and relevant

The user is interested in medium-to-large technology companies, but relevant
smaller companies may also be presented when the opportunity is strong.

---

# 13. Search Iteration

If the first search produces poor results:

1. Try alternative job titles.
2. Search different companies.
3. Search official company career pages.
4. Search Greenhouse, Lever, or Workday.
5. Search different geographic terms.
6. Search both English and Spanish terminology when useful.
7. Relax overly restrictive technology filters.
8. Expand from internships to new-grad/entry-level roles when appropriate.

Do not stop after one unsuccessful query.

If no strong opportunities exist, say so honestly.

Do not fill the report with irrelevant jobs simply to produce a longer list.

---

# 14. Freshness

Prioritize recently posted positions.

When possible, determine:

- posting date
- last updated date
- application deadline
- whether applications are still being accepted

Prefer recent listings.

Be cautious with listings that appear to have been online for a long time.

If the listing's current status cannot be established, say so.

---

# 15. Application Deadlines

If a deadline is available, report it.

If no deadline is provided, do not invent one.

If a position appears to close soon, highlight it.

Example:

    ⚠️ Deadline: August 25, 2026

If the deadline has already passed, do not recommend the position unless the
listing clearly remains active.

---

# 16. Official Application Links

Whenever possible, provide the official application page.

Prefer:

- company's official careers site
- official Greenhouse listing
- official Lever listing
- official Workday listing

Do not direct the user to a search-engine result when a direct application
page is available.

Do not invent application URLs.

---

# 17. Search Results Format

When presenting multiple opportunities, use a compact structure.

For example:

    ## 1. Company — Software Engineer Intern
    Match: Excellent
    Location: Mexico City
    Type: Internship

    Why it matches:
    - ...
    - ...

    Important requirements:
    - ...
    - ...

    Potential concerns:
    - ...

    Application:
    [official application page]

Do not reproduce entire job descriptions.

Summarize the information that matters for the user's decision.

---

# 18. Prioritize Quality

A smaller list of strong opportunities is better than a large list of weak
ones.

As a default, aim for approximately:

- 3–10 strong opportunities

rather than dozens of poorly matched listings.

If there are fewer strong opportunities, report fewer.

If there are many excellent opportunities, rank them.

---

# 19. Ranking

When several positions are available, rank them using:

1. Overall fit
2. Seniority fit
3. Location eligibility
4. Technical alignment
5. Likelihood that the user meets the requirements
6. Recency
7. Company/opportunity quality

Explain the most important reason for the ranking.

Do not pretend to know the user's probability of getting an interview.

Use phrases such as:

- "strong fit"
- "reasonable fit"
- "some gaps"
- "worth applying despite the gap"

rather than claiming a specific hiring probability.

---

# 20. Don't Automatically Apply

Never:

- submit an application
- fill out an application
- send an email to a recruiter
- contact a company
- accept an offer

unless the user explicitly requests an action and the necessary tools and
authorization are available.

Finding and evaluating opportunities is the default task.

---

# Scheduled Searches

This skill is designed to work with Hermes scheduled/cron jobs.

When executed as a scheduled job:

1. Perform fresh web searches.
2. Consult relevant user memory.
3. Identify new opportunities.
4. Remove duplicates.
5. Verify promising listings.
6. Rank the strongest matches.
7. Produce a concise report.

Do not assume that the user is present when running a scheduled search.

Do not ask unnecessary clarification questions during an automated search.

If there are no worthwhile new opportunities, report:

    No strong new opportunities found today.

Do not fill the report with weak matches.

---

# Daily Search Behavior

For a daily search, prioritize positions that are:

- newly posted
- newly discovered
- still accepting applications
- relevant to the user's seniority
- eligible for Mexico
- not previously reported
- not already applied to

Search multiple categories rather than repeatedly searching the same query.

For example:

### Internship

- Software Engineer Intern
- Software Engineering Intern
- Backend Engineer Intern
- AI/ML Engineer Intern

### New Grad

- Software Engineer — New Grad
- Software Engineer — University Graduate
- Software Engineer — Early Career

### Entry Level / Junior

- Entry-Level Software Engineer
- Junior Software Engineer
- Junior Backend Engineer
- Software Developer — Entry Level

Adapt these searches as the job market and user's goals change.

---

# When the User Finds a Job

If the user gives you a job listing or asks whether they should apply:

1. Read the complete listing when possible.
2. Determine the actual requirements.
3. Compare them against the user's known background.
4. Identify hard requirements.
5. Identify preferred qualifications.
6. Identify potential concerns.
7. Give a recommendation.

Use:

- **Apply** — strong enough fit to justify applying
- **Probably apply** — some gaps but worthwhile
- **Consider** — meaningful uncertainty
- **Probably skip** — significant mismatch
- **Skip** — clearly unsuitable

Do not discourage an application merely because the user does not meet every
preferred qualification.

---

# When the User Applies

If the user says they applied to a position:

1. Confirm the position being discussed.
2. Remember the application.
3. Record the company, position, and status when useful.
4. Avoid recommending that exact position again.

If the user later updates the status, update the memory.

Examples:

    Applied → OA received → Interview → Rejected

or:

    Applied → Interview → Offer

Do not infer a status that the user did not provide.

---

# Beginner-Friendly Explanations

The user is still learning about professional recruiting and job searching.

When explaining a job listing:

- explain unfamiliar recruiting terminology
- distinguish required vs preferred qualifications
- explain why a technology requirement matters
- explain what "new grad" or "entry level" means when relevant
- explain work authorization requirements
- explain ambiguous location requirements

Do not assume the user understands recruiting terminology.

---

# Response Style

For a normal job-search request, prefer:

1. **Quick summary**
2. **Best opportunities**
3. **Why each is relevant**
4. **Potential concerns**
5. **Application links**
6. **What I would prioritize**

For a single job:

1. **Verdict**
2. **Why**
3. **Strong matches**
4. **Gaps**
5. **Application considerations**

Be honest about uncertainty.

Do not exaggerate the user's qualifications.

---

# Verification

Before finishing a job-search task, verify when possible that:

- the position is still active
- the location is eligible
- the seniority is appropriate
- the application page works
- the position has not already been applied to
- the position has not already been reported
- the information presented is supported by the listing

If something could not be verified, explicitly state that.

Never fabricate:

- salary
- deadlines
- location eligibility
- application status
- job availability
- recruiter information
- requirements

---

# Final Principle

The purpose of Job Hunter is not to find the maximum number of jobs.

The purpose is to help the user answer:

> "What are the genuinely worthwhile positions I could apply to right now?"

Prefer accurate, current, relevant opportunities over quantity.
