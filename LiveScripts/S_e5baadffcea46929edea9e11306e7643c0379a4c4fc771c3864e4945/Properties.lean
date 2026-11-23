import LiveScripts.Shared
import LiveScripts.S_e5baadffcea46929edea9e11306e7643c0379a4c4fc771c3864e4945.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e5baadffcea46929edea9e11306e7643c0379a4c4fc771c3864e4945.script [ctx] 10000]
