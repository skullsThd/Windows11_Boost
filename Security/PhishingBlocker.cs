using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;

namespace SiteBlocker
{
    public class SiteBlocker
    {
        private List<string> blockedDomains;

        public SiteBlocker()
        {
            blockedDomains = LoadBlockedDomains(); // Carica la lista dei domini bloccati
        }

        public bool IsSiteBlocked(string url)
        {
            var domain = GetDomainFromUrl(url);
            return blockedDomains.Contains(domain);
        }

        public void PreventDataEntryOnBlockedSite()
        {
            Console.Write("Inserisci un URL: ");
            string url = Console.ReadLine();

            if (IsSiteBlocked(url))
            {
                Console.WriteLine("Il sito è bloccato. Impossibile inserire dati.");
            }
            else
            {
                Console.WriteLine("Il sito non è bloccato. Puoi inserire i dati.");
                // Qui puoi implementare la logica per l'inserimento dei dati nel sito
            }
        }

        private List<string> LoadBlockedDomains()
        {
            var blockedDomains = new List<string>();
            try
            {
                // Carica la lista dei domini bloccati da un file di testo
                blockedDomains = File.ReadAllLines("blocked_domains.txt").ToList();
            }
            catch (FileNotFoundException)
            {
                Console.WriteLine("File blocked_domains.txt non trovato.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Errore durante il caricamento dei domini bloccati: " + ex.Message);
            }
            return blockedDomains;
        }

        private string GetDomainFromUrl(string url)
        {
            Uri uri;
            if (Uri.TryCreate(url, UriKind.Absolute, out uri))
            {
                return uri.Host;
            }
            return string.Empty;
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            var siteBlocker = new SiteBlocker();
            siteBlocker.PreventDataEntryOnBlockedSite();
        }
    }
}
