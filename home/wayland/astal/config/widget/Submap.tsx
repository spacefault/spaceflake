import { createBinding, Accessor } from "ags"

import Hyprland from "gi://AstalHyprland"


export default function Submap(): JSX.Element {
    const hyprland = Hyprland.get_default()
    const clients = createBinding(hyprland, "clients")
    const submapvar = createBinding(hyprland, "submap")

  const submapVar = new Variable(current);
  hypr.connect('submap', (_, name) => {
    submapVar.set(name);
  });
  const submap = bind(submapVar);
    return <box class={"submap"}>
        <label
            class={"submap"}
            label={submap}
        />
    </box>
}