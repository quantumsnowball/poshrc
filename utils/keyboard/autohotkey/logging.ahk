LOG_FILE := A_ScriptDir "\log.txt"

Log(message) {
    FileAppend message "`n", LOG_FILE
}
