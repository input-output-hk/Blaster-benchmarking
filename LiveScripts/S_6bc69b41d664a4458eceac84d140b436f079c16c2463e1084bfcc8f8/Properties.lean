import LiveScripts.Shared
import LiveScripts.S_6bc69b41d664a4458eceac84d140b436f079c16c2463e1084bfcc8f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6bc69b41d664a4458eceac84d140b436f079c16c2463e1084bfcc8f8.script [ctx] 10000]
