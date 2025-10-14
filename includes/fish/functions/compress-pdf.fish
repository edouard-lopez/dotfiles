function compress-pdf \
    --description 'Compress a PDF file by converting it to Djvu and back to PDF. outputFile name is optional' \
    --argument-names inputFile \
    --argument-names outputFile \
    --argument-names dpi

    if not test -f "$inputFile"
        echo "❌ Input file not found: $inputFile"
        return 1
    end

    set djvuFile (string replace '.pdf' '.djvu' $inputFile)    
    set --query $dpi[1]; or set dpi 300 # smaller dpi means smaller file size but lower quality
    pdf2djvu --dpi=$dpi --output="$djvuFile" "$inputFile"
    if test $status -eq 0
        echo "✅ Converted to Djvu"
    else
        echo "❌ Failed to convert to Djvu"
        return 1
    end

    set --query $outputFile[1]; or set outputFile (string replace '.pdf' '.compressed.pdf' $inputFile)
    set --query $quality[1]; or set quality 75 # smaller quality means smaller file size but lower quality
    ddjvu -verbose -format=pdf -quality=$quality "$djvuFile" "$outputFile"
    if test $status -eq 0
        echo "✅ Compressed back to PDF"
    else
        echo "❌ Failed to compress to PDF"
        return 1
    end
end





