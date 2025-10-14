compress_pdf() {
    local inputFile="$1"
    local outputFile="$2"
    local djvuFile

    if [ -z "$inputFile" ]; then
        echo "Usage: compress_pdf inputFile [outputFile]"
        return 1
    fi

    if [ -z "$outputFile" ]; then
        outputFile="${inputFile%.pdf}.compressed.pdf"
    fi
    djvuFile="${inputFile%.pdf}.djvu"

    if pdf2djvu --dpi=300 --output="$djvuFile" "$inputFile"; then
        echo "✅ Converted to Djvu"
    else
        echo "❌ Failed to convert to Djvu"
        return 1
    fi

    if ddjvu -format=pdf -quality=85 "$djvuFile" "$outputFile"; then
        echo "✅ Compressed back to PDF"
    else
        echo "❌ Failed to compress to PDF"
        return 1
    fi
}