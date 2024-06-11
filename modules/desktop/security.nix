{
  config,
  lib,
  pkgs,
  ...
}: {
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.swaylock = {};
      services.swaylock.text = ''
        auth include login
      '';
      services.gnome-keyring.gnupg.enable = true;
      services.gnome-keyring.sshAgentAuth = true;
      services.gnome-keyring.enableGnomeKeyring = true;
    };
  };

  # the following is merged from
  # https://github.com/hlissner/dotfiles/blob/master/modules/security.nix
  # https://github.com/sioodmy/dotfiles/blob/main/system/core/schizo.nix

  ### security modifications
  security.protectKernelImage = true;
  boot.tmp.useTmpfs = lib.mkDefault true;
  boot.tmp.cleanOnBoot = lib.mkDefault (!config.boot.tmp.useTmpfs);
  boot.loader.systemd-boot.editor = false;
  boot.kernel.sysctl = {
    "kernel.sysrq" = 0;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";
  };
  boot.kernelModules = ["tcp_bbr"];
  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 1;
    "kernel.printk" = "3 3 3 3";
    "dev.tty.ldisc_autoload" = 0;
    "net.ipv4.conf.all.log_martians" = true;
    "net.ipv4.conf.default.log_martians" = true;
    "net.ipv4.icmp_echo_ignore_all" = "1";
    "kernel.yama.ptrace_scope" = 2;
    "net.core.bpf_jit_enable" = false;
    "kernel.ftrace_enabled" = false;
  };

  boot.blacklistedKernelModules = [
    "ax25"
    "netrom"
    "rose"
    "adfs"
    "affs"
    "bfs"
    "befs"
    "cramfs"
    "efs"
    "erofs"
    "exofs"
    "freevxfs"
    "f2fs"
    "vivid"
    "gfs2"
    "ksmbd"
    "nfsv4"
    "nfsv3"
    "cifs"
    "nfs"
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "squashfs"
    "udf"
    "hpfs"
    "jfs"
    "minix"
    "nilfs2"
    "omfs"
    "qnx4"
    "qnx6"
    "sysv"
  ];
}
