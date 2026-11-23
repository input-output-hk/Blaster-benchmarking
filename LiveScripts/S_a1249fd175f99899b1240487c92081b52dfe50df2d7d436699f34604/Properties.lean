import LiveScripts.Shared
import LiveScripts.S_a1249fd175f99899b1240487c92081b52dfe50df2d7d436699f34604.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a1249fd175f99899b1240487c92081b52dfe50df2d7d436699f34604.script [ctx] 10000]
