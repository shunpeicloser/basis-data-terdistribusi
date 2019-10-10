# Evaluasi Tengah Semester Mata Kuliah Basis Data Terdistribusi #
## Design and Implementation ##
- [Desain infrastruktur](https://github.com/shunpeicloser/basis-data-terdistribusi/tree/master/ets/desain)
- [Implementasi Basis Data](https://github.com/shunpeicloser/basis-data-terdistribusi/tree/master/ets/implementasi)

## Development Environment ##
Linux Mint 19.1 Teressa 8GB 64-bit

## Requirements ##
- Virtual Box
- Vagrant
- Apache Web Server
- Mysql (File diletakkan dalam folder 'Provision')
- ProxySQL + addition_to_sys.sql (File diletakkan dalam folder 'Provision')
- Web App ([E-Laporan](https://github.com/rtejakusuma/elaporan))

## Outline ##
- Instalasi Requirement dan persiapan
- Pembuatan dan pengaturan Vagrantfile
- Pembuatan shell script untuk provisioning
- Pembuatan SQL script untuk pengaturan group replication
- Pembuatan SQL script untuk pengaturan ProxySQL
- Pengaturan Web App