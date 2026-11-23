import LiveScripts.Shared
import LiveScripts.S_3674326a0f07fb515f357e5c072d10ae5344bcf6ee69db64e6030549.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3674326a0f07fb515f357e5c072d10ae5344bcf6ee69db64e6030549.script [ctx] 10000]
