import LiveScripts.Shared
import LiveScripts.S_78bf460e558b50ffb1a56c5f0a523111831bc5a5d166b23771035b9c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78bf460e558b50ffb1a56c5f0a523111831bc5a5d166b23771035b9c.script [datum, redeemer, ctx] 10000]
