import LiveScripts.Shared
import LiveScripts.S_a904455f964515aa9290ca443efe93fe8d654c1ebc22b1562af07c39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a904455f964515aa9290ca443efe93fe8d654c1ebc22b1562af07c39.script [datum, redeemer, ctx] 10000]
