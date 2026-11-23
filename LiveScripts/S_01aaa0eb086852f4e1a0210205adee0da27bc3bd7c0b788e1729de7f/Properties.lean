import LiveScripts.Shared
import LiveScripts.S_01aaa0eb086852f4e1a0210205adee0da27bc3bd7c0b788e1729de7f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_01aaa0eb086852f4e1a0210205adee0da27bc3bd7c0b788e1729de7f.script [ctx] 10000]
