import LiveScripts.Shared
import LiveScripts.S_bcd713bb7858d4b08738bed90ee7068d8f9b38d02e0cae0b45ac7a9b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bcd713bb7858d4b08738bed90ee7068d8f9b38d02e0cae0b45ac7a9b.script [ctx] 10000]
