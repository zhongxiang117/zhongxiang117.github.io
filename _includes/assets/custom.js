$('.rst-content .document .section .admonition-pre ul li').each(function() {
    text = $(this).text().trim();
    if (text.length) {
        $(this).html(text);
    } else {
        $(this).remove();
    };
});

$('.rst-content .document .section .admonition-pre ul').replaceWith('<pre><ol>' +
    $('.rst-content .document .section .admonition-pre ul').html() + '</ol></pre>');