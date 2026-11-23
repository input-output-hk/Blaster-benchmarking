import LiveScripts.Shared
import LiveScripts.S_cb10dec901d2ea19dc700373b3efec923ae5988345531e4e29d039ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb10dec901d2ea19dc700373b3efec923ae5988345531e4e29d039ba.script [ctx] 10000]
