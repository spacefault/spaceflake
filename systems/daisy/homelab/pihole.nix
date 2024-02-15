{
  ...
}: let
  serverIP = "127.0.0.1";
in {
  virtualisation.oci-containers = {
    backend = "docker";
    containers.pihole = {
      autoStart = true;
      image = "pihole/pihole:latest";
      ports = [
        "${serverIP}:53:53/tcp"
        "${serverIP}:53:53/udp"
        "3080:80"
        "30443:443"
      ];
      volumes = [
        "/var/lib/pihole/:/etc/pihole/"
        "/var/lib/dnsmasq.d:/etc/dnsmasq.d/"
      ];
      environment = {
        ServerIP = serverIP;
        TZ = "Canada/Edmonton";
      };
      extraOptions = [
        "--cap-add=NET_ADMIN"
        "--dns=127.0.0.1"
        "--dns=1.1.1.1"
      ];
    };
  };
}
