import LiveScripts.Shared
import LiveScripts.S_d1bb9d075e3893feebdea9a351b2a122e0fb8b7d4dc6d8ddecf4003d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1bb9d075e3893feebdea9a351b2a122e0fb8b7d4dc6d8ddecf4003d.script [ctx] 10000]
