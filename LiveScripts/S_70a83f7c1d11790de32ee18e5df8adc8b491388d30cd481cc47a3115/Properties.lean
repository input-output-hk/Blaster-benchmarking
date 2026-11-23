import LiveScripts.Shared
import LiveScripts.S_70a83f7c1d11790de32ee18e5df8adc8b491388d30cd481cc47a3115.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_70a83f7c1d11790de32ee18e5df8adc8b491388d30cd481cc47a3115.script [ctx] 10000]
