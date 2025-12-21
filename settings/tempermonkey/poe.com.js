// ==UserScript==
// @name Poe Chat Width
// @namespace http://tampermonkey.net/
// @version 0.1
// @description Change poe.com chat div width
// @match https://poe.com/*
// ==/UserScript==

(() => {
    'use strict';

    const useMyHandler = () => {
        const disableContextMenu = () => {
            // restore default context menu
            setTimeout(() => {
                document.querySelectorAll('div[class^=ChatPageMain_container]').forEach(row => {
                    row.addEventListener('contextmenu', e => e.stopPropagation());
                    row.addEventListener('touchstart', e => e.stopPropagation());
                });
            }, 2000)
        };
        // apply initially
        disableContextMenu();
        // apply when changing bots
        document.querySelectorAll('a[class^=PageWithSidebarNavItem_newNavItem]').forEach(link => {
            link.addEventListener('click', disableContextMenu);
        });
    };

    const useMyStyle = () => {
        // Define the new CSS style you want to apply
        const newStyle = `
            /* allow text selection */
            html {
                user-select: text;
            }

            /* font size */
            @media screen and (max-width: 800px) {
                a[class^=PageWithSidebarNavItem_navItem] {
                    font-size: var(--font-size-small);
                    padding: var(--spacing-small);
                }
            }
            @media screen and (max-width: 684px) {
                div[class^=Message_humanMessageBubble], div[class^=Message_botMessageBubble], [class^=MarkdownCodeBlock_preTag] {
                    font-size: var(--font-size-small);
                }
            }

            /* full width chat area */
            aside[class^=PageWithSidebarLayout_leftSidebar] {
                flex: 0;
                min-width: unset;
            }
            div[class^=PageWithSidebarLayout_centeredPage] {
                max-width: unset;
            }
            div[class^=PageWithSidebarLayout_mainSection] {
                max-width: unset;
            }
            section[class^=PageWithSidebarLayout_mainSectionWrapper] {
                overflow-x: hidden;
            }
            div[class^=PageWithSidebarLayout_mainSection] {
                flex: 1 1 100%;
                max-width: unset;
            }

            /* full width message bubble */
            div[class^=Message_botMessageBubble] {
                max-width: unset;
                margin-right: 0;
            }

            /* code block horizontal scrollable */
            [class^=MarkdownCodeBlock_preTag] {
                overflow-x: auto !important;
            }
            [class^=MarkdownCodeBlock_codeTag] {
                white-space: pre !important;
            }
        `;

        // Create a new style element and append it to the document head
        const styleElement = document.createElement('style');
        styleElement.innerText = newStyle;
        document.head.appendChild(styleElement);
    }

    // apply these custom config initially
    setTimeout(() => {
        useMyHandler();
        useMyStyle();
    }, 1000);
})();
