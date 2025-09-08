import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Clock from "./Clock"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const time = createPoll("", 1000, "date")
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
  return (
    <window
      visible
      name="Bar"
      class="Bar"
      monitor={0}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox" class="centerbox">
        <box $type="start" class={"start"}>
          <box class="leftsidebox">
            something
          </box>
        </box>
        <box $type="center" class="notch">
          something
        </box>
        <box $type="end">
          <Clock/>
        </box>
      </centerbox>
    </window>
  )
}
