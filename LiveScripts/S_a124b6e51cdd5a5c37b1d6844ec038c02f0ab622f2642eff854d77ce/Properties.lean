import LiveScripts.Shared
import LiveScripts.S_a124b6e51cdd5a5c37b1d6844ec038c02f0ab622f2642eff854d77ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a124b6e51cdd5a5c37b1d6844ec038c02f0ab622f2642eff854d77ce.script [ctx] 10000]
