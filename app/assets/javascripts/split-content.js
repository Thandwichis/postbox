function splitContent(content, maxCharsPerPage) {
    const contentPages = [];
    let currentIndex = 0;

    while (currentIndex < content.length) {
        let endIndex = Math.min(currentIndex + maxCharsPerPage, content.length);
        contentPages.push(content.substring(currentIndex, endIndex));
        currentIndex = endIndex;
    }

    return contentPages;
}
