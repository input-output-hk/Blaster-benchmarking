import LiveScripts.Shared
import LiveScripts.S_6f0c4e5774c1c211510f6a11e278d33799a4d5cb3aada5e5be289ff6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f0c4e5774c1c211510f6a11e278d33799a4d5cb3aada5e5be289ff6.script [ctx] 10000]
