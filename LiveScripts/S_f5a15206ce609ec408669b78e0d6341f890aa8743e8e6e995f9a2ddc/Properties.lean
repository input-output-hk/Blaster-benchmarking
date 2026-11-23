import LiveScripts.Shared
import LiveScripts.S_f5a15206ce609ec408669b78e0d6341f890aa8743e8e6e995f9a2ddc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5a15206ce609ec408669b78e0d6341f890aa8743e8e6e995f9a2ddc.script [ctx] 10000]
