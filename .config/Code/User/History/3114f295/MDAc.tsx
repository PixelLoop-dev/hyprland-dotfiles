const PowerMenu = () => {
  return (
    <box className="power-menu" vertical>
      <button onClick={() => Utils.exec("systemctl poweroff")}>
        ⏻ Power Off
      </button>
      <button onClick={() => Utils.exec("systemctl reboot")}>
        🔄 Reboot
      </button>
      <button onClick={() => Utils.exec("systemctl suspend")}>
        🌙 Suspend
      </button>
      <button onClick={() => App.closeWindow("powermenu")}>
        ❌ Cancel
      </button>
    </box>
  )
}

app.start({
  main() {
    
  },
})