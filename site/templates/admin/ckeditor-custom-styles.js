CKEDITOR.stylesSet.add('mystyles', [
    // Block-level styles
    { name: 'Normal', element: 'p'},
    { name: 'Heading 1', element: 'h1'},
    { name: 'Heading 2', element: 'h2'},
    { name: 'Heading 3', element: 'h3'},
    { name: 'Heading 4', element: 'h4'},
    { name: 'Heading 5', element: 'h5'},
    { name: 'Heading 6', element: 'h6'},
    { name: 'Span', element: 'span'},
    { name: 'small', element: 'small'},

    // Inline styles
    { name: 'Button', element: 'a', attributes: { 'class': 'button pg-editor-unwrap pg-style-panel', 'id': 'button' } },
    { name: 'Link', element: 'a', attributes: { 'class': 'link pg-editor-unwrap pg-style-panel', 'id': 'link' } },
    { name: 'Span', element: 'span', attributes: { 'class': 'span pg-style-panel' } },

    // Object styles
    { name: 'List', element: 'ul', attributes: { 'class': 'pg-style-panel' } },
    { name: 'List Child', element: 'li', attributes: { 'class': 'pg-style-panel' } },
  
    { name: 'Table', element: 'table', attributes: { 'class': 'pg-style-panel' } },
    { name: 'Table Row', element: 'td', attributes: { 'class': 'pg-style-panel' } }
  
  
]);