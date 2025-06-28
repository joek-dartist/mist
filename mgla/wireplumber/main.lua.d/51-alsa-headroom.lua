alsa_monitor.rules = {
  {
    matches = {
      { { "node.name", "matches", "alsa_output.*" } },
    },
    apply_properties = {
      ["api.alsa.headroom"] = 4096,
    },
  },
}
