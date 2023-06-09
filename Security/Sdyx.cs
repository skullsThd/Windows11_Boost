using ClamAV.Net.Client;
using ClamAV.Net.Commands;
using ClamAV.Net.Entities;

public class FileScanner
{
    private readonly ClamAvClient clamAvClient;

    public FileScanner()
    {
        clamAvClient = new ClamAvClient("127.0.0.1", 3310); // Configura l'indirizzo IP e la porta del server ClamAV
    }

    public async Task<bool> IsFileInfected(string filePath)
    {
        if (File.Exists(filePath))
        {
            var scanResult = await clamAvClient.ScanFile(filePath);
            return scanResult.Result == ClamScanResults.VirusDetected;
        }

        return false;
    }
}

public class Program
{
    public static async Task Main(string[] args)
    {
        var fileScanner = new FileScanner();

        string filePath = "path_to_file"; // Specifica il percorso del file da scansionare

        bool isInfected = await fileScanner.IsFileInfected(filePath);

        if (isInfected)
        {
            Console.WriteLine("Il file contiene un virus.");
        }
        else
        {
            Console.WriteLine("Il file è sicuro.");
        }
    }
}
