import LiveScripts.Shared
import LiveScripts.S_229863ae8694da16da002e889a1d19bcc82c581225b6dcca95fd69da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_229863ae8694da16da002e889a1d19bcc82c581225b6dcca95fd69da.script [datum, redeemer, ctx] 10000]
