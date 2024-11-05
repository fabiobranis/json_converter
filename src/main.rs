use std::fs::{self, File};
use std::io::{BufRead, BufReader, Write};

fn main() -> std::io::Result<()> {
    let input_dir = "./assets"; // pasta onde estão os arquivos .txt
    let output_file_path = "./merged.json"; // caminho para o arquivo json de saída

    // Obtém uma lista de todos os arquivos .txt na pasta
    let paths = fs::read_dir(input_dir)?
        .filter_map(Result::ok)
        .filter(|p| p.path().extension().and_then(|s| s.to_str()) == Some("txt"))
        .collect::<Vec<_>>();

    let mut output_file = File::create(&output_file_path)?;

    writeln!(output_file, "[")?;

    for (i, path) in paths.iter().enumerate() {
        let input_file_path = path.path();
        let input_file = File::open(&input_file_path)?;
        let reader = BufReader::new(input_file);

        for (j, line) in reader.lines().enumerate() {
            let line = line?;
            if i > 0 || j > 0 {
                writeln!(output_file, ",")?;
            }
            write!(output_file, "{}", line)?;
        }
    }

    writeln!(output_file, "\n]")?;

    Ok(())
}
