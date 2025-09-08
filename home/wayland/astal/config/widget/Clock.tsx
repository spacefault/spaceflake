import { createPoll } from "ags/time"

export default function Clock() {
    const datetime = createPoll("", 1000, "date +'%a %b %d %I:%M %p'")
    return <box class={"clock"}>
        <label
            class={"date"}
            label={datetime}
        />
    </box>
}


