# Executive Summary  
This report surveys leading AI-driven UX/UI design prompts from top designers, repositories, and communities. We identify and quote exemplar prompts for building websites (from sources like Taskade, blogs, and design galleries), then organize them by design purpose (layout, color/style, accessibility, content, interaction). We rank prompt sources by community engagement (e.g. user counts, stars) and explain the metrics. Common phrasing patterns (e.g. “Create a [style] [component]” or “Ensure [quality] and [feature]”) are extracted. Finally, we offer **10 ready-to-use prompt templates** (annotated with usage tips) and compare sources in a summary table.  A bar chart visualizes top sources by engagement and a flowchart outlines the prompt-to-design workflow.

## Top UX/UI Design Prompts (with Sources)  
- **“Create a clean website layout for a tech startup. Include a hero section, navigation bar, video section, social proof, pricing section, and contact page. Use soft colors, white space, and a modern color palette. Generate HTML code and explain the structure.”【36†L117-L120】** – A concise prompt guiding layout, style, and coding for a startup site.  
- **“Create a landing page for a productivity app. Include a hero section with a primary cta button, feature list, video demo, social proof section, and pricing section. Use dark mode design and modern color palette.”【36†L140-L144】** – Focuses on conversion elements and dark-mode style for a product.  
- **“Create a minimal personal blog website with a cream background, soft colors, blog post grid, author section, and navigation bar. Generate HTML code and suggest images.”【36†L161-L165】** – Specifies content layout and aesthetic for a blog.  
- **“Create a figma design for a modern marketing website. Use soft colors, balanced white space, and a clean layout. Include hero section, video section, feature grid, and social proof.”【36†L181-L185】** – Emphasizes visual style and key sections for a marketing site.  
- **“Generate code for a contact page with form validation using a modern programming language. Include name field, email field, message box, and submit button.”【36†L197-L201】** – Directs the AI to produce functional code for a contact form.  
- **“Design a clear and user-friendly navigation for our website [Website Name] to enhance the user experience. Begin by assessing the website’s content and structure. Create an intuitive navigation menu that organizes content logically and prioritizes key pages or sections. Specify menu labels, drop-down menus if applicable, and any additional navigation elements such as search bars or breadcrumbs. Ensure that the navigation is responsive and accessible across devices. Provide a wireframe or visual representation of the proposed navigation for review and implementation.”【42†L42-L49】** – Comprehensive prompt for crafting site navigation, stressing logic, responsiveness, and accessibility.  
- **“Create an AI prompt for designing a website footer that effectively includes essential elements like contact information, social media links, quick navigation to key sections, and a brief about the company. Ensure the design is aesthetically pleasing, mobile-responsive, and matches the website’s overall style while maintaining simplicity for easy user interaction.”【14†L83-L90】** – A meta-prompt from Taskade, exemplifying how to specify common footer features and style.  
- **“Create a mobile-responsive website layout for an e-commerce fashion retailer. Ensure the design prioritizes intuitive navigation, fast loading times, and optimized images for mobile devices. Include user-friendly menus, a seamless checkout process, and prominent call-to-action buttons. Incorporate a clean, modern aesthetic that enhances the shopping experience on smartphones and tablets. Use scalable code to guarantee compatibility across various screen sizes.”【54†L81-L89】** – Directs attention to mobile performance, shopping workflow, and responsive design for an online store.  

These prompts (full quotes above) illustrate how designers describe layouts, elements, styles, and functionality in clear, friendly language (e.g. “modern color palette”, “user-friendly menus”, “clean aesthetic”【36†L117-L120】【54†L81-L89】).

## Prompt Categories by Purpose  
- **Layout & Structure:** Prompts that define page sections and layout. E.g. the “hero section, navigation bar, video section, … pricing section” sequence in the startup layout prompt【36†L117-L120】, or the blog grid and author section layout【36†L161-L165】. These ensure logical structure.  
- **Color and Style:** Prompts specifying visual aesthetics. Many use adjectives: “soft colors, white space, modern color palette”【36†L117-L120】; “dark mode design and modern color palette”【36†L140-L144】; “clean, modern aesthetic”【54†L81-L89】. They often mention mood (e.g. minimalist, editorial) or tool references (e.g. “inspired by coolors.co”【40†L160-L163】).  
- **Accessibility and Responsiveness:** Prompts explicitly requiring inclusive design. For example, navigation and footer prompts stress “mobile-responsive” and “accessible across devices”【42†L42-L49】【14†L83-L90】. They mention contrast, keyboard navigation, or screen-reader compliance (seen in some AI prompt libraries).  
- **Content & Copy (Microcopy):** Prompts that guide writing text and microcopy. The above contact-page prompt focuses on fields and labels【36†L197-L201】, while others (not quoted) might prompt writing CTAs or body text. Good prompts often ask for “explain structure” or “suggest images”, indicating content generation.  
- **Interaction & Motion:** Prompts covering dynamic elements. While few prompts explicitly mention animations, some templates (like header design) require hover and dropdown behavior【46†L49-L58】. Designers may add “smooth animation” or “subtle transitions” for interactive polish.  
- **Onboarding & Flows:** Though less common explicitly, some prompts allude to user flows (e.g. “checkout process” in the e-commerce prompt【54†L83-L89】). Templates can include onboarding screens, tutorials, or progressive disclosure steps to guide users gradually.

Each prompt tends to combine multiple aspects (layout + style + functionality). In practice, designers break tasks into themed prompts (e.g. one for structure, one for style).

## Community Endorsement & Ranking  
We assess prompt popularity via community metrics. Taskade’s prompt library boasts **1M+ users**【14†L83-L90】, making its navigation/footer prompts extremely widely endorsed. Among Figma community tools, the “figgpt” plugin has over **100k users**【23†L44-L48】, indicating high usage of its UI prompts. The DocsBot “Modern Website Header” prompt is from a platform with **75k+ users**【46†L94-L99】. For comparison, Figma’s “AI Designer” plugin has ~30k users【23†L44-L48】. GitHub resources see modest stars (e.g. the eonist gist had a few), and blog articles (Rocket, Base44) reach design audiences but have fewer direct metrics.  

By these measures, the most endorsed prompts come from Taskade and high-install Figma plugins. We use numeric metrics like user installs or “Loved by” counts where available. A bar chart below compares engagement (in thousands) for major prompt sources:  

【Indicator Chart: Top sources by engagement】  

【54†embed_image】 *Figure: Engagement (approximate user count) of AI design prompt sources【14†L83-L90】【46†L94-L99】【23†L44-L48】.*  

## Common Prompt Patterns and Phrases  
Analysis reveals recurring phrasing in effective prompts:  
- **Imperative with goal and context:** Many start with a verb: “Create/Design/Generate a [style] [component]” or “Build a [type of site]…”. For example, “Create a clean website layout for a tech startup…”【36†L117-L120】 or “Design a clear and user-friendly navigation…”【42†L42-L49】.  
- **Specified sections/components:** Designers enumerate key parts (e.g. “hero section, navigation bar, video section, social proof…”【36†L117-L120】; “feature list, video demo, social proof section, and pricing section”【36†L140-L144】). This breaks complexity into actionable elements.  
- **Stylistic adjectives:** Common adjectives include *modern, clean, intuitive, user-friendly, responsive, mobile-friendly, accessible, minimalist, balanced.* E.g. “soft colors, balanced white space, clean layout”【36†L181-L185】 or “dark mode design, modern color palette”【36†L140-L144】.  
- **Performance and UX cues:** Prompts often add “fast loading times”, “optimized images”, “smooth animation”, “responsive design”, emphasizing best practices【54†L83-L89】【46†L49-L58】. Phrases like “intuitive navigation” or “seamless checkout” reflect UX goals.  
- **Output instructions:** Many prompts request specific output formats, e.g. “Generate HTML code and explain the structure”【36†L117-L120】 or “Provide a wireframe or visual representation”【42†L42-L49】. This guides AI to deliver structured results.  

These patterns (goal + list of elements + style cues) form templates designers reuse, often combining multiple best-practices in one prompt.

## Prompt Templates (Ready-to-Use, with Notes)  
Below are 10 prompt templates. Each combines key components; use them as starting points and customize to your project context.

1. **Multi-step, Multi-persona Site Design Prompt:**  
   ```
   You are **DesignAssistant**, a team of design experts (UX designer, UI designer, content strategist).  
   - *Before starting*, clarify project goals: “What is the website’s purpose, target audience, and brand identity?” Resolve any ambiguities.  
   1. *Persona (UX)*: Outline the website structure. List required pages or sections (homepage, features, about, etc.) and describe the user journey.  
   2. *Persona (UI)*: Decide on visual style. Specify color palette, typography, and overall aesthetic (e.g. minimalist, playful, corporate). Suggest a mood or theme.  
   3. *Persona (Content)*: Draft key microcopy. Write headings, labels, and call-to-action text for each section. Ensure tone is friendly and concise.  
   4. *Persona (Developer)*: Recommend any technical considerations (responsive layout, accessibility).  
   After these steps, **DesignAssistant**, generate the website design (wireframes or HTML/CSS) incorporating all above decisions.  
   ```  
   *When to use:* A thorough template for complex projects needing clear roles and stages. Best used interactively: first get answers for each persona, then finalize design. *Best practice:* Explicitly role-play each expert and iterate step-by-step before generating final design.*

2. **Startup Website Layout Prompt:**  
   > *“Create a clean website layout for a **tech startup**. Include a hero section, navigation bar, feature section, social proof (testimonials or logos), pricing plans, and a contact section. Use soft colors and ample white space to look modern. Ensure the layout is responsive. Generate HTML/CSS and explain each section’s purpose.”*  
   *Use when:* You need a full-page layout for a startup or SaaS site. *Notes:* Naming your industry or product helps contextualize content. Asking for code + explanation encourages a structured response.

3. **Landing Page (Product) Prompt:**  
   > *“Design a landing page for a **productivity app**. Include a hero banner with a prominent call-to-action, a list of key features, an embedded demo video, a social proof section (user quotes or logos), and a pricing table. Use a dark mode theme with a modern color accent. Provide the layout concept and HTML structure.”*  
   *Use when:* Focus is on a conversion-oriented homepage. *Notes:* Mentioning the app type and style (dark mode) tailors the output. Ensure to specify the CTA (e.g. “Try Now”).

4. **Personal Blog Site Prompt:**  
   > *“Generate a minimal personal blog website. Use a cream background with soft accent colors. Include a navigation bar, a homepage with a grid of blog post previews (title, snippet, date), and an author/about section. Ensure typography is clean and legible. Output a Figma design or HTML/CSS for the home page layout.”*  
   *Use when:* You need a simple, elegant blog design. *Notes:* Highlight “minimal” and color preference. Asking for Figma output (if supported) can yield mockup images.

5. **Modern Marketing Site Prompt (Figma):**  
   > *“Create a marketing website design using Figma for a new startup. Use a contemporary layout with balanced white space. Specify a soft color palette and modern sans-serif fonts. Include a large hero section, followed by a split feature grid (text and images), a testimonial slider, and a lead-capture form. Ensure consistency across sections.”*  
   *Use when:* You want a polished mockup in Figma. *Notes:* Mentioning the tool and specific components (sliders, forms) guides the design detail. Reference a style (e.g. “contemporary”) for tone.

6. **Contact Page Functionality Prompt:**  
   > *“Generate code for a contact page form with validation. Include input fields: Name, Email, Message, and a Submit button. Validate that name and email are not empty and email has proper format. Show user-friendly error messages. Provide HTML/CSS/JavaScript code example.”*  
   *Use when:* You need working code for a contact form. *Notes:* Be specific about fields and validation rules. This prompt is more technical – useful for developers.

7. **Navigation Menu Design Prompt:**  
   > *“Design a clear and responsive navigation menu for **[Your Website Name]**. Start by analyzing the site’s sections. Create a menu structure with logical labels and any dropdowns needed. Include elements like a search bar or breadcrumbs if relevant. Ensure the menu works on mobile (e.g. a hamburger toggle) and follows accessibility best practices (high-contrast text, keyboard focus states). Provide a wireframe sketch or description.”*  
   *Use when:* Crafting or refining site navigation. *Notes:* Replace bracketed name. Emphasize responsiveness and accessibility to cover all devices.

8. **Footer & Global Elements Prompt:**  
   > *“Create a website footer design that includes: contact info, social media links, quick links to main pages, and a brief company blurb. Keep it visually simple but on-brand. Suggest how it remains consistent across pages and responsive on mobile. Provide the HTML structure and styling notes.”*  
   *Use when:* Finalizing the site’s bottom section. *Notes:* Footers often repeat on all pages; mention consistency. “On-brand” ties it to existing color/text styles.

9. **Mobile-First E-commerce Prompt:**  
   > *“Design a mobile-responsive homepage for an **e-commerce fashion store**. Prioritize fast-loading images and simple navigation (e.g. a sticky menu or icons). Include prominent promotional banners, category highlights, and a large “Shop Now” button in the hero. Ensure the checkout link is easily accessible. Use a clean, modern aesthetic that appeals to shoppers on smartphones.”*  
   *Use when:* Building or auditing a shop’s home page. *Notes:* Calling out “mobile-responsive” and UX tasks (checkout, loading) ensures technical viability. 

10. **Accessibility Improvement Prompt:**  
   > *“Review our website’s homepage and suggest accessibility improvements. Check color contrast for text, ensure all images have alt text, confirm keyboard navigation, and verify semantic HTML usage. List any issues and how to fix them (e.g. ARIA labels, larger text, simpler navigation).”*  
   *Use when:* Conducting an accessibility audit. *Notes:* Though slightly different in tone (review rather than design), it embodies best practices (progressive enhancement). It can guide iterative fixes.

Each template above follows best practices (specifying context, sections, style, and outcome) and can be customized (e.g. replace “productivity app” with your product). Annotate them with project-specific details and expected outputs to get the best results.

## Source Comparison  

| Source / Author           | Community / Platform         | Engagement (Metric)         | Date        | Relevance                            |
|---------------------------|------------------------------|-----------------------------|-------------|--------------------------------------|
| Taskade (AI Prompts Team) | Taskade AI Prompt Library    | “Loved by 1M+ users”【14†L83-L90】 | 2025 (approx) | Official prompt library (layout, components) |
| docsbot.ai (UglyRobot)    | DocsBot Prompt Repository    | “Loved by 75k+ users”【46†L94-L99】 | 2024 | Curated AI prompts (header design)   |
| Rocket (Rakesh Purohit)   | *Rocket Blog (UX/devel.)*    | Popular tech blog (metric n/a) | Mar 2026   | Practical prompt examples (full-site) |
| Base44 (AI Builders)      | *Base44 blog*                |  Blog read by AI devs (n/a)  | Jan 2026    | AI prompt techniques (dashboard, page) |
| Figma Community (figgpt)  | Figma Plugin “figgpt”        | 100k+ installs【23†L44-L48】  | 2023?       | UI text/UX plugin (phrase generators) |
| DesignPrompts (M.kenneth) | designprompts.dev            | Community showcase (free resource) | 2023 (beta) | AI-generated style gallery (Claude prompts) |
| eonist (GitHub Gist)      | GitHub (gist)                | 2 stars, 0 forks            | 2023        | Collection of design AI plugins/prompts |
| CrazyEgg (blog)           | *CrazyEgg Blog*              | SEO/design blog (n/a)       | 2023        | Analysis of AI prompt strategies      |

*Table: Selected prompt sources, their context, engagement, and focus.* Engagement is indicated where available (e.g. user/install counts)【14†L83-L90】【23†L44-L48】【46†L94-L99】. Taskade and Figma plugins have clear metrics; blogs and community projects are noted for reach and topic.

```mermaid
flowchart LR
    A[Define project goals & audience] --> B[Specify design requirements & style]
    B --> C[Compose detailed AI prompt (layout, components, style)]
    C --> D[AI generates initial design (wireframe/mockup)]
    D --> E[Review design for UI hierarchy, color, content, accessibility]
    E --> F{Issue?} -->|Yes| G[Refine prompt or ask follow-up for improvements]
    F -->|No| H[Finalize design assets and code]
```  
*Figure: Prompt-to-design workflow (mermaid flowchart). Start by clarifying goals, then specify requirements, generate design with AI, review it, and iterate until final design is ready.*

**Sources:** We quoted and analyzed actual prompts from Taskade【42†L42-L49】【54†L81-L89】, blog posts【36†L117-L120】, and other design resources to ensure authenticity and practical relevance. All examples preserve original wording and citations for transparency. Each citation links to a connected source used in this analysis.