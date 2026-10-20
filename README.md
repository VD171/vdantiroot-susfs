# vdantiroot-susfs

The **SUSFS** definitions (and only those) from my `vdantiroot` module, extracted to share as a
reference. Covers `add_sus_path`, `add_sus_map`, `add_sus_kstat`, `enable_avc_log_spoofing`,
`hide_sus_mnts` and the sdcard paths.

Portuguese version: [README.pt.md](README.pt.md)

## How it works

`susfs.sh` auto-detects which SUSFS variant is present and routes the commands:

- **LKM** ([inforcqb/susfs4ksu-lkm](https://github.com/inforcqb/susfs4ksu-lkm)): applies the rules through the `/proc/susfs_*` nodes.
- **Classic** (susfs4ksu via `ksu_susfs`): applies everything through the `ksu_susfs` binary.
- **None**: becomes a no-op.

## Environment dependencies

This is not a standalone script - it is an excerpt that runs **inside** the module, so it expects:

- `$BIN` - directory where the `ksu_susfs` binary lives.

Adjust the `add_sus_map`/`add_sus_path` paths to the modules **you** use.

## Alternative

If you do not own yours, **BRENE** is an alternative:
[github.com/rrr333nnn333/BRENE](https://github.com/rrr333nnn333/BRENE) · [t.me/rrr333nnn333updates](https://t.me/rrr333nnn333updates)

## Contact

- Site: [vd171.ru](https://vd171.ru)
- Site: [vd.priv8.ru](https://vd.priv8.ru)
- Source: [github.com/VD171/vdantiroot-susfs](https://github.com/VD171/vdantiroot-susfs)
- GitHub: [@VD171](https://github.com/VD171)
- XDA-Developers: [@VD171](https://xdaforums.com/m/vd171.4699873/)
- Telegram: [@VD_Priv8](https://t.me/VD_Priv8)
- Discord: [@VD.Priv8](https://discord.com/users/1296831918989639721)
- E-mail: [vd.priv8@pm.me](mailto:vd.priv8@pm.me)
