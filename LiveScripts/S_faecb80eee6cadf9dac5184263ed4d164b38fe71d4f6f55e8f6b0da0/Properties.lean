import LiveScripts.Shared
import LiveScripts.S_faecb80eee6cadf9dac5184263ed4d164b38fe71d4f6f55e8f6b0da0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_faecb80eee6cadf9dac5184263ed4d164b38fe71d4f6f55e8f6b0da0.script [ctx] 10000]
