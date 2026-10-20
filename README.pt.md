# vdantiroot-susfs

As definições de **SUSFS** (e somente elas) do meu módulo `vdantiroot` - extraídas para compartilhar
como referência. Cobre `add_sus_path`, `add_sus_map`, `add_sus_kstat`, `enable_avc_log_spoofing`,
`hide_sus_mnts` e os caminhos de sdcard.

Versão em inglês: [README.md](README.md)

## Como funciona

O `susfs.sh` detecta sozinho a variante de SUSFS presente e roteia os comandos:

- **LKM** ([inforcqb/susfs4ksu-lkm](https://github.com/inforcqb/susfs4ksu-lkm)): aplica as regras pelos nós em `/proc/susfs_*`.
- **Clássico** (susfs4ksu via `ksu_susfs`): aplica tudo pelo binário `ksu_susfs`.
- **Nenhum**: vira no-op.

## Dependências de ambiente

Não é um script standalone - é um excerto que roda **dentro** do módulo, então espera:

- `$BIN` - diretório onde está o binário `ksu_susfs`.

Ajuste os caminhos em `add_sus_map`/`add_sus_path` para os módulos que **você** usa.

## Alternativa

Se você não tem o seu próprio, o **BRENE** é uma alternativa:
[github.com/rrr333nnn333/BRENE](https://github.com/rrr333nnn333/BRENE) · [t.me/rrr333nnn333updates](https://t.me/rrr333nnn333updates)

## Contatos

- Site: [vd171.ru](https://vd171.ru)
- Site: [vd.priv8.ru](https://vd.priv8.ru)
- Source: [github.com/VD171/vdantiroot-susfs](https://github.com/VD171/vdantiroot-susfs)
- GitHub: [@VD171](https://github.com/VD171)
- XDA-Developers: [@VD171](https://xdaforums.com/m/vd171.4699873/)
- Telegram: [@VD_Priv8](https://t.me/VD_Priv8)
- Discord: [@VD.Priv8](https://discord.com/users/1296831918989639721)
- E-mail: [vd.priv8@pm.me](mailto:vd.priv8@pm.me)
