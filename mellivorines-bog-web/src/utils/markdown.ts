import MarkdownIt from "markdown-it";
import MarkdownItAbbr from "markdown-it-abbr";
import MarkdownItFootnote from "markdown-it-footnote";
import MarkdownItSub from "markdown-it-sub";
import MarkdownItSup from "markdown-it-sup";
import mermaidPlugin from "@agoose77/markdown-it-mermaid";
import mermaidItKatex from "@iktakahiro/markdown-it-katex";
import mermaidItKatexExternal from "markdown-it-katex-external";
// import MarkdownItContainer from "markdown-it-container";
import MarkdownItMark from "markdown-it-mark";
import MarkdownItEmoji from "markdown-it-emoji";
import MarkdownItIns from "markdown-it-ins";


import hljs from "highlight.js/lib/core";
import "highlight.js/styles/ir-black.css";

import bash from 'highlight.js/lib/languages/bash'
import javascript from 'highlight.js/lib/languages/javascript';
import typescript from 'highlight.js/lib/languages/typescript';
import java from 'highlight.js/lib/languages/java';
import kotlin from 'highlight.js/lib/languages/kotlin';
import sql from 'highlight.js/lib/languages/sql';
import nginx from 'highlight.js/lib/languages/nginx';
import json from 'highlight.js/lib/languages/json';
import yaml from 'highlight.js/lib/languages/yaml';
import xml from 'highlight.js/lib/languages/xml';
import shell from 'highlight.js/lib/languages/shell'

hljs.registerLanguage('bash', bash)
hljs.registerLanguage('javascript', javascript);
hljs.registerLanguage('typescript', typescript);
hljs.registerLanguage('java', java);
hljs.registerLanguage('kotlin', kotlin);
hljs.registerLanguage('sql', sql);
hljs.registerLanguage('nginx', nginx);
hljs.registerLanguage('json', json);
hljs.registerLanguage('yaml', yaml);
hljs.registerLanguage('xml', xml);
hljs.registerLanguage('shell', shell);


export default function markdownToHtml(content: any) {
    const md = new MarkdownIt({
        html: true,
        linkify: true,
        breaks: true,
        xhtmlOut: true,
        typographer: true,
        highlight: function (str:any, lang:string) {
            if (lang && hljs.getLanguage(lang)) {
                try {
                    return (
                        '<pre class="hljs"><code>' +
                        hljs.highlight(lang, str, true).value +
                        "</code></pre>"
                    );
                } catch (__) {
                }
            }

            return (
                '<pre class="hljs"><code>' +
                md.utils.escapeHtml(str) +
                "</code></pre>"
            );
        },
    })
        .use(mermaidItKatexExternal)
        .use(MarkdownItEmoji)
        .use(MarkdownItSup)
        .use(MarkdownItSub)
        .use(MarkdownItFootnote)
        .use(MarkdownItAbbr)
        .use(MarkdownItIns)
        .use(MarkdownItMark)
        .use(mermaidItKatex)
        .use(mermaidPlugin);
    return md.render(content)
}