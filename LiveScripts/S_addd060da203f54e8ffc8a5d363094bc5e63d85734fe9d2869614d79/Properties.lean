import LiveScripts.Shared
import LiveScripts.S_addd060da203f54e8ffc8a5d363094bc5e63d85734fe9d2869614d79.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_addd060da203f54e8ffc8a5d363094bc5e63d85734fe9d2869614d79.script [ctx] 10000]
