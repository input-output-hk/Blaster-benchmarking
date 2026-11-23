import LiveScripts.Shared
import LiveScripts.S_9fe89059a6d59d7d5b9648425d76d8d7aaaef41e0c950de1faf48005.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9fe89059a6d59d7d5b9648425d76d8d7aaaef41e0c950de1faf48005.script [ctx] 10000]
