import LiveScripts.Shared
import LiveScripts.S_adc69e50e299f8a317fc8af383b55666db85fcb5c2576305372af0bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_adc69e50e299f8a317fc8af383b55666db85fcb5c2576305372af0bb.script [ctx] 10000]
