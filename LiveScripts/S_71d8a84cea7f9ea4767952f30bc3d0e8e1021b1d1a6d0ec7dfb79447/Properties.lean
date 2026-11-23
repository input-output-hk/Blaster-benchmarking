import LiveScripts.Shared
import LiveScripts.S_71d8a84cea7f9ea4767952f30bc3d0e8e1021b1d1a6d0ec7dfb79447.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71d8a84cea7f9ea4767952f30bc3d0e8e1021b1d1a6d0ec7dfb79447.script [ctx] 10000]
