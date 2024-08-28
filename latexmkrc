# Use lualatex for compilation
$pdflatex = 'lualatex %O %S';

# Enable continuous preview mode
$pdf_mode = 1;

# Automatically clean up auxiliary files after building
$clean_ext = 'aux bbl blg idx ind lof log lot out toc fls fdb_latexmk synctex.gz';

# Set the options for lualatex
$pdflatex = 'lualatex -shell-escape -interaction=nonstopmode -synctex=1 %O %S';

# Sync PDF viewer automatically after build (Zathura example)
$pdf_previewer = 'zathura';
$pdf_update_method = 2;

# Ensure that the correct directory is used
$aux_dir = 'build';
$out_dir = 'build';

# Custom dependency handling for multiple files
@default_files = ('notes.tex', 'AsymptoticNotation.tex');

# Recursively search for changes in included files
$recorder = 1;

# Force compilation of the main file if any dependency changes
$clean_full_ext = 'out.bbl out.blg';
add_cus_dep('tex', 'pdf', 0, 'do_pdf_tex');

sub do_pdf_tex {
    system("latexmk -pdf notes.tex");
}

# Ensure all included files are checked for changes
push @input_extensions, 'tex';

