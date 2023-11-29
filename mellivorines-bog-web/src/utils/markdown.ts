import MarkdownIt from "markdown-it";
import MarkdownItAbbr from "markdown-it-abbr";
import MarkdownItAnchor from "markdown-it-anchor";
import MarkdownItFootnote from "markdown-it-footnote";
import MarkdownItHighlightjs from "markdown-it-highlightjs";
import MarkdownItSub from "markdown-it-sub";
import MarkdownItSup from "markdown-it-sup";
import MarkdownItTasklists from "markdown-it-task-lists";
import MarkdownItTOC from "markdown-it-toc-done-right";

export default function markdownToHtml(content: any) {
    const md = new MarkdownIt({
        html: true
    })
        .use(MarkdownItAbbr)
        .use(MarkdownItAnchor)
        .use(MarkdownItFootnote)
        .use(MarkdownItHighlightjs)
        .use(MarkdownItSub)
        .use(MarkdownItSup)
        .use(MarkdownItTasklists)
        .use(MarkdownItTOC);
    return md.render(content)
}
