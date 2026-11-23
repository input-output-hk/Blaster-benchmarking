import LiveScripts.Shared
import LiveScripts.S_a11774152ca1a0c52a37f7da4d2ba8760a659ff8a14de97eb238edde.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a11774152ca1a0c52a37f7da4d2ba8760a659ff8a14de97eb238edde.script [ctx] 10000]
