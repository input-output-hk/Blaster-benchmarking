import LiveScripts.Shared
import LiveScripts.S_fe935ad0f423e42deb5d23b43a1439fb7bbbbb411404c1cf7115af52.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe935ad0f423e42deb5d23b43a1439fb7bbbbb411404c1cf7115af52.script [datum, redeemer, ctx] 10000]
