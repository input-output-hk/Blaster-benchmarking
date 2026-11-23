import LiveScripts.Shared
import LiveScripts.S_569668996cb7f4e88e743919d16f13dd69308838a1a831f77b187407.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_569668996cb7f4e88e743919d16f13dd69308838a1a831f77b187407.script [ctx] 10000]
