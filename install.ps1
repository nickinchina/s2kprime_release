#mkdir "C:\s2kagent";
cd "C:\s2kagent";

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

write-host "download nssm";
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Method Get -Uri  https://nssm.cc/release/nssm-2.24.zip -OutFile .\nssm.zip; 

write-host "install nssm";
Unzip "C:\s2kagent\nssm.zip" "C:\s2kagent";
rm "C:\s2kagent\nssm.zip";


write-host "install chocolatey"
#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

write-host "install virtualbox"
#choco install virtualbox;

write-host "download s2kagent"
#Invoke-WebRequest -Method Get -Uri http://ftp1.s2konline.net/vm/s2kagent.ova -OutFile .\s2kagent.ova; 

write-host "create s2kagent vm"
#&"C:\Program Files\Oracle\VirtualBox\vboxmanage.exe" import .\s2kagent.ova --vsys 0 --vmname s2kagent

write-host "install vm windows service"
#&"C:\s2kagent\nssm-2.24\win64\nssm.exe" install s2kagent "C:\Program Files\Oracle\VirtualBox\vboxheadless.exe" "-s s2kagent"




